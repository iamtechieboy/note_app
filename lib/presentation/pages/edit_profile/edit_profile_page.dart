import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/utils/bottom_sheet.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';
import 'package:note_app/presentation/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:note_app/presentation/widgets/edit_file_change_image_bottom_sheet_menu.dart';

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
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          onBackTap: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 12,
            top: 22,
            bottom: 34,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 174,
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                Assets.images.userSettings,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            IconicOvalButton(
                              text: "Change Image",
                              onTap: () {
                                //  Change Imageda Cubit bor. Lekin showbutomni qoshalmadim
                                // Cubit berish kere ekan ashinga boshqa componenta yozip utrippan
                                //  agar tog'ri bosa qoloradi
                                // o'zgartizsez o'zgartiroring

                                showCustomBottomSheet(
                                    context: context,
                                    body: CustomBottomSheet(
                                        body: EditFileBottomSheetMenu(
                                      bloc: context.read<EditProfileCubit>(),
                                    )));
                              },
                              icon: Assets.icons.edit,
                              boxDecoration: AppDecoration.outline,
                              iconColor: AppColors.primaryColor.base,
                              textColor: AppColors.primaryColor.base,
                              height: 38,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Divider(
                          color: AppColors.neutralColor.lightGrey,
                          height: 1,
                          thickness: 3,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ),
                      editProfile(
                        fullName: "Full Name",
                        hintText: "Example: Michael Antonio",
                        keyboardInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: editProfile(
                          fullName: "Email Address",
                          hintText: "Example: johndoe@gmail.com",
                          keyboardInputType: TextInputType.emailAddress,
                        ),
                      ),
                      Text(
                        "Changing email address information means you need to re-login to the apps.",
                        style: AppTextStyle.regular2Xs.copyWith(
                          color: AppColors.neutralColor.baseGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconicOvalButton(
                text: "Save Changes",
                onTap: () {},
                icon: Assets.icons.check,
                isWidthMax: true,
                height: 54,
                cornerRadius: 27,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget editProfile({
    required String fullName,
    required String hintText,
    required TextInputType keyboardInputType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullName,
          style: AppTextStyle.mediumBase,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextField(
            // bu yerga controller joylanadi

            style: AppTextStyle.regularBase,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: AppTextStyle.regularBase.copyWith(color: AppColors.neutralColor.baseGrey),
              fillColor: AppColors.neutralColor.baseGrey,
            ),
            keyboardType: keyboardInputType,
          ),
        ),
      ],
    );
  }
}
