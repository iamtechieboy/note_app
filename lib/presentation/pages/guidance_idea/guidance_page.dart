import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/core/utils/bottom_sheet.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/circular_icon_place.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';
import 'package:note_app/presentation/components/note_text_field.dart';
import 'package:note_app/presentation/components/title_text_field.dart';
import 'package:note_app/presentation/pages/guidance_idea/bloc/guidance_cubit.dart';

import '../../../config/constants/assets.dart';
import '../../widgets/edit_photo_bottom_sheet_menu.dart';

class GuidancePage extends StatefulWidget {
  const GuidancePage({super.key});

  @override
  State<GuidancePage> createState() => _GuidancePageState();
}

class _GuidancePageState extends State<GuidancePage> {
  late TextEditingController titleEditingController;
  late TextEditingController noteEditingController;

  @override
  void initState() {
    titleEditingController = TextEditingController();
    noteEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuidanceCubit(),
      child: Scaffold(
        backgroundColor: AppColors.neutralColor.white,
        appBar: CustomAppBar(onBackTap: () => Navigator.pop(context)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              children: [
                TitleTextField(
                  titleHint: "Title Here",
                  textEditingController: titleEditingController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BlocBuilder<GuidanceCubit, GuidanceState>(
                    builder: (context, state) {
                      return state.images != null
                          ? Container(
                              decoration: AppDecoration.defDecor.copyWith(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      state.images!,
                                      width: double.infinity,
                                      height: 280,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: CircularIconPlace(
                                      onTap: () {
                                        showCustomBottomSheet(
                                            context: context,
                                            body: CustomBottomSheet(
                                                body: EditPhotoBottomSheetMenu(
                                              bloc:
                                                  context.read<GuidanceCubit>(),
                                            )));
                                      },
                                      height: 58,
                                      icon: Assets.icons.pencil,
                                      iconColor: AppColors.primaryColor.base,
                                      background: AppColors.neutralColor.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : DottedBorder(
                              dashPattern: const [12, 12],
                              strokeWidth: 1.3,
                              color: AppColors.neutralColor.baseGrey,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 280,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularIconPlace(
                                        height: 58,
                                        icon: Assets.icons.photo,
                                        iconColor: AppColors.primaryColor.base,
                                        background:
                                            AppColors.primaryColor.light,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 20),
                                        child: SizedBox(
                                          width: 240,
                                          child: Text(
                                            "Upload an Image to your guidance can be choose for you",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyle.mediumSm.copyWith(
                                              color: AppColors
                                                  .neutralColor.baseGrey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconicOvalButton(
                                        height: 42,
                                        text: 'Choose a file',
                                        onTap: () {
                                          context
                                              .read<GuidanceCubit>()
                                              .openGallery();
                                        },
                                        cornerRadius: 21,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 21),
                                        textStyle: AppTextStyle.mediumBase
                                            .copyWith(
                                                color: AppColors
                                                    .neutralColor.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ),
                NoteTextField(textEditingController: noteEditingController)
              ],
            ),
            BottomTaskBar(onTapDelete: () {  }, onTapPinNote: () {}, isPinned: false,),
          ],
        ),
      ),
    );
  }
}
