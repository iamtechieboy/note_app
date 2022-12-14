import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/domain/entities/enums.dart';
import 'package:note_app/core/utils/hive_util.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/note_text_field.dart';
import 'package:note_app/presentation/pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';
import 'package:note_app/services/notifications.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_style.dart';
import '../../../config/constants/assets.dart';
import '../../../core/utils/show_dialog.dart';
import '../../components/title_text_field.dart';
import '../../widgets/reminder_info_widget.dart';

class InterestingIdeaPage extends StatefulWidget {
  const InterestingIdeaPage({Key? key, this.model, this.updateIndex}) : super(key: key);

  final InterestingIdeaModel? model;
  final int? updateIndex;

  @override
  State<InterestingIdeaPage> createState() => _InterestingIdeaPageState();
}

class _InterestingIdeaPageState extends State<InterestingIdeaPage> with HiveUtil {
  final NoteType _noteType = NoteType.interesting;
  late final TextEditingController titleEditingController;
  late final TextEditingController noteEditingController;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");
  late InterestingIdeaModel _itemModel;

  @override
  void initState() {
    titleEditingController = TextEditingController(text: widget.model!.title ?? '');
    noteEditingController = TextEditingController(text: widget.model!.noteBody ?? '');
    if (widget.model != null) {
      context.read<BottomSheetCubit>().fillBottomSheetToEdit(widget.model!, context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: CustomAppBar(
        onBackTap: () async {
          pressBack(context);
        },
      ),
      body: BlocBuilder<AddInterestingIdeaCubit, AddInterestingIdeaState>(builder: (context, state) {
        return state.isDeleted
            ? Container(color: AppColors.primaryColor.background)
            : WillPopScope(
                onWillPop: () {
                  pressBack(context);
                  return Future.value(true);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            TitleTextField(
                              titleHint: "Title Here",
                              textEditingController: titleEditingController,
                            ),
                            NoteTextField(textEditingController: noteEditingController),
                            Visibility(
                              visible: state.isReminderDateVis || state.isLabelVis,
                              child: const ReminderInfo(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomTaskBar(
                      onTapDelete: () {
                        showCustomDialog(
                          context: context,
                          title: 'Deleting Notes',
                          contentText: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Are you sure you want to\n delete this note? \n\n',
                              style: AppTextStyle.regularBase.copyWith(
                                color: AppColors.neutralColor.darkGrey,
                              ),
                              children: const [
                                TextSpan(text: 'Deleting the note means\n it will gone forever'),
                              ],
                            ),
                          ),
                          icon: Assets.icons.delete,
                          iconBackgroundColor: AppColors.errorColor.light,
                          iconColor: AppColors.errorColor.base,
                          positive: "Delete",
                          onPositiveTap: () {
                            if (widget.model != null) {
                              context.read<AddInterestingIdeaCubit>().deleteNote(widget.model!, widget.model!.key);
                              context.read<BottomSheetCubit>().cleanBottomSheet();
                              Navigator.pop(context);
                              showCustomDialog(
                                dismissible: false,
                                context: context,
                                title: 'Notes Deleted',
                                contentText: Text(
                                  'This notes no longer appeared \n on your dashboard',
                                  style: AppTextStyle.regularBase.copyWith(
                                    color: AppColors.neutralColor.darkGrey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                icon: Assets.icons.sadEmoji,
                                iconColor: AppColors.errorColor.base,
                                iconBackgroundColor: AppColors.errorColor.light,
                                positive: 'Close',
                                buttonHeight: 54,
                                onPositiveTap: () {
                                  context.read<AddInterestingIdeaCubit>().state.isDeleted = false;
                                  Navigator.popUntil(context, (route) => route.isFirst);
                                },
                              );
                            }
                          },
                          negative: "Cancel",
                          onNegativeTap: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      onTapPinNote: () {
                        context.read<AddInterestingIdeaCubit>().pinNote(!state.isPinned);
                        if (widget.model != null) {
                          context
                              .read<AddInterestingIdeaCubit>()
                              .pinNoteSave(widget.model!.key, widget.updateIndex!, !state.isPinned);
                        }
                      },
                      isPinned: state.isPinned,
                    ),
                  ],
                ),
              );
      }),
    );
  }

  pressBack(BuildContext context) {
    var addIntCubit = context.read<AddInterestingIdeaCubit>();
    var bottomSheetCubit = context.read<BottomSheetCubit>();
    try {
      if (titleEditingController.text.isNotEmpty && noteEditingController.text.isNotEmpty) {
        _itemModel = InterestingIdeaModel(
          noteType: _noteType.name,
          title: titleEditingController.text.toString(),
          noteBody: noteEditingController.text.toString(),
          isFinished: false,
          isPinned: addIntCubit.state.isPinned,
          itemColor: bottomSheetCubit.state.colorIndex,
          labels: bottomSheetCubit.state.givenLabel,
          lastEditedTime: dateFormat.format(DateTime.now()),
          remindedDay: '${bottomSheetCubit.state.remindDay ?? ''}',
          remindedTime: '${bottomSheetCubit.state.remindTime ?? ''}',
        );
        if (widget.model!.title != null) {
          addIntCubit.update(_itemModel, widget.model!.key, widget.updateIndex!);
        } else {
          addIntCubit.addNewItemToTheList(_itemModel);
        }
        if (bottomSheetCubit.state.isReminderOn!) {
          var timeOfDay = TimeOfDay.fromDateTime(bottomSheetCubit.state.remindTime!);
          var fullDate = DateTimeField.combine(bottomSheetCubit.state.remindDay!, timeOfDay);
          notificationService!.scheduleNotifications(
              id: 1, title: 'Notification for NoteApp', body: 'This notification is test', time: fullDate);
        }
        bottomSheetCubit.cleanBottomSheet();
        addIntCubit.reminderDateVis(false);
        addIntCubit.givenLabelVis(false);
      } else if (titleEditingController.text.isEmpty && noteEditingController.text.isEmpty) {
        bottomSheetCubit.cleanBottomSheet();
      }
      Navigator.pop(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
