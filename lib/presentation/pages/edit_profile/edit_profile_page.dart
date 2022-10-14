import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/utils/bottom_sheet.dart';
import 'package:note_app/presentation/components/circular_icon_place.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';
import 'package:note_app/presentation/components/textfield_with_label.dart';
import 'package:note_app/presentation/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:note_app/presentation/widgets/edit_file_change_image_bottom_sheet_menu.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController controllerEditProfileFullName;
  late TextEditingController controllerEditProfileEmail;

  @override
  void initState() {
    super.initState();
    controllerEditProfileFullName = TextEditingController();
    controllerEditProfileEmail = TextEditingController();
  }

  @override
  void dispose() {
    controllerEditProfileFullName;
    controllerEditProfileEmail;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Edit Profile",
          onBackTap: () => Navigator.pop(context),
          backTitle: "Settings",
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 24,
              bottom: 32,
            ),
            child: SizedBox(
              height: size.height - 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    BlocBuilder<EditProfileCubit, EditProfileState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 190,
                          child: Column(
                            children: [
                              if (state.images != null)
                                Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(120 / 2),
                                    child: Image.file(
                                      state.images!,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                )
                              else
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: RDottedLineBorder.all(
                                      width: 2,
                                      dottedLength: 10,
                                      dottedSpace: 5,
                                      color: AppColors.neutralColor.baseGrey,
                                    ),
                                  ),
                                  child: CircularIconPlace(
                                    height: 120,
                                    icon: Assets.icons.photo,
                                    iconColor: AppColors.primaryColor.base,
                                    background: AppColors.primaryColor.light,
                                    iconHeight: 48,
                                  ),
                                ),
                              const SizedBox(
                                height: 16,
                              ),
                              IconicOvalButton(
                                text: "Change Image",
                                onTap: () {
                                  showCustomBottomSheet(
                                    context: context,
                                    body: CustomBottomSheet(
                                      body: EditFileBottomSheetMenu(
                                        bloc: context.read<EditProfileCubit>(),
                                        isDeleteVisible: state.images != null,
                                      ),
                                    ),
                                  );
                                },
                                icon: Assets.icons.edit,
                                boxDecoration: AppDecoration.outline,
                                iconColor: AppColors.primaryColor.base,
                                textColor: AppColors.primaryColor.base,
                                height: 40,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Divider(
                        color: AppColors.neutralColor.lightGrey,
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    TextFieldWithLabel(
                        label: "FullName",
                        hintText: "Example: Michael Antonio",
                        keyboardInputType: TextInputType.name,
                        controller: controllerEditProfileFullName),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: TextFieldWithLabel(
                        label: "Email Address",
                        hintText: "Example: johndoe@gmail.com",
                        keyboardInputType: TextInputType.emailAddress,
                        controller: controllerEditProfileEmail,
                      ),
                    ),
                    Text(
                      "Changing email address information means you need to re-login to the apps.",
                      style: AppTextStyle.regular2Xs.copyWith(
                        color: AppColors.neutralColor.baseGrey,
                      ),
                    ),
                  ]),
                  IconicOvalButton(
                    text: "Save Changes",
                    onTap: () {},
                    icon: Assets.icons.check,
                    height: 54,
                    cornerRadius: 27,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    isWidthMax: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
