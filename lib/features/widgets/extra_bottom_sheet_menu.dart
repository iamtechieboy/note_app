import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utils/show_given_labels_shorter.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';
import '../../config/constants/local_data.dart';
import '../components/custom_bottom_sheet.dart';
import '../components/extras_menu_button.dart';
import 'bloc/bottom_sheet_cubit.dart';
import 'custom_color_picker.dart';
import 'extras_give_label_session.dart';
import 'extras_remind_day_time_session.dart';
import 'extras_remind_repeat_day_session.dart';
import 'extras_reminder_session.dart';

class ExtrasBottomSheetMenuBody extends StatefulWidget {
  ExtrasBottomSheetMenuBody({Key? key, required this.onTapFinished, required this.onTapDelete}) : super(key: key);

  Function() onTapFinished;
  Function() onTapDelete;

  @override
  State<ExtrasBottomSheetMenuBody> createState() => _ExtrasBottomSheetMenuBodyState();
}

class _ExtrasBottomSheetMenuBodyState extends State<ExtrasBottomSheetMenuBody> {
  List<Widget> pages = [];

  TextEditingController controllerLabel = TextEditingController();

  @override
  void initState() {
    pages = [
      extrasMainPage(),
      extrasSetReminderSession(),
      extrasSetRemindDaySession(),
      extrasSetRemindTimeSession(),
      extrasSetRepeatDaysSession(),
      extrasSetCustomRepeatDays(),
      extrasGiveLabelSession(controllerLabel)
    ];
    super.initState();
    controllerLabel.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    double currentHeight = heightsBottomSheet[context.read<BottomSheetCubit>().state.currentView!].values.first;
    Curve curve = Curves.easeOutBack;
    context.read<BottomSheetCubit>().setLastHeight(currentHeight);
    return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
      builder: (context, state) {
        return CustomBottomSheet(
          title: heightsBottomSheet[state.currentView!].keys.first,
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: curve,
            height: state.currentView! == 6 ? state.changeHeight : heightsBottomSheet[state.currentView!].values.first,
            child: pages[state.currentView!],
          ),
          onBackTap: () {
            context.read<BottomSheetCubit>().changeCurrentView(state.currentView!);
          },
        );
      },
    );
  }

  Widget extrasMainPage() {
    return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16),
                child: Text(
                  "CHANGE BACKGROUND",
                  style: AppTextStyle.regularXs.copyWith(color: AppColors.neutralColor.darkGrey),
                ),
              ),
              // Color picker for that project
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomColorPicker(),
              ),
              // Divider
              Padding(
                padding: const EdgeInsets.all(16),
                child: Divider(
                  color: AppColors.neutralColor.lightGrey,
                  thickness: 1,
                  height: 1,
                ),
              ),
              // Extra menus label
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16),
                child: Text(
                  "EXTRAS",
                  style: AppTextStyle.regularXs.copyWith(color: AppColors.neutralColor.darkGrey),
                ),
              ),
              // Set Reminder
              ExtrasMenuButton(
                icon: Assets.icons.clock,
                menuTitle: "Set Reminder",
                label: (state.remindTime != null && state.remindDay != null)
                    ? "${dayFormatWithSlash.format(state.remindDay!)}, ${hourFormatFor.format(state.remindTime!)}"
                    : "Not set",
                isArrowVisible: true,
                onTap: () {
                  context.read<BottomSheetCubit>().navigateTo(1);
                },
              ),
              // TODO: Thinking about adding it
              // ExtrasMenuButton(
              //   icon: Assets.icons.edit,
              //   menuTitle: "Change Note Type",
              //   label: "Buying something",
              //   isArrowVisible: true,
              //   onTap: () {},
              // ),
              ExtrasMenuButton(
                icon: Assets.icons.tag,
                menuTitle: "Give Label",
                isArrowVisible: true,
                label: state.givenLabel.isNotEmpty ? showGivenLabelsShorter(state.givenLabel) : "Not set",
                onTap: () {
                  context.read<BottomSheetCubit>().navigateTo(6);
                },
              ),
              ExtrasMenuButton(
                icon: Assets.icons.check,
                menuTitle: "Mark as Finished",
                onTap: () {
                  widget.onTapFinished();
                },
              ),
              // Divider
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Divider(
                  color: AppColors.neutralColor.lightGrey,
                  thickness: 1,
                  height: 1,
                ),
              ),
              ExtrasMenuButton(
                icon: Assets.icons.delete,
                iconColor: AppColors.errorColor.base,
                menuTitle: "Delete Note",
                menuTitleColor: AppColors.errorColor.base,
                onTap: () {
                  widget.onTapDelete();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
