import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/utils/bottom_sheet.dart';
import 'package:note_app/core/utils/show_dialog.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';
import 'package:note_app/presentation/components/extras_menu_button.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';
import 'package:note_app/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:note_app/presentation/widgets/notificaton_bottom_sheet_menu.dart';

import '../../../config/constants/app_colors.dart';
import '../../routes/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: CustomAppBar(title: "Settings", onBackTap: () => Navigator.pop(context)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  child: Image.asset(Assets.images.userSettings),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Michael Antonio",
                        style: AppTextStyle.boldLg,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.mail,
                            color: AppColors.neutralColor.darkGrey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "anto_michael@gmail.com",
                              style: AppTextStyle.regular2Xs.copyWith(color: AppColors.neutralColor.darkGrey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: IconicOvalButton(
              height: 38,
              text: 'Edit Profile',
              textColor: AppColors.primaryColor.base,
              icon: Assets.icons.edit,
              iconColor: AppColors.primaryColor.base,
              boxDecoration: AppDecoration.outline,
              onTap: () {
                Navigator.pushNamed(context, Routes.editProfilePage);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              height: 1,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16),
            child: Text(
              "APP SETTINGS",
              style: AppTextStyle.regularXs.copyWith(color: AppColors.neutralColor.darkGrey),
            ),
          ),
          ExtrasMenuButton(
            icon: Assets.icons.lockClosed,
            menuTitle: 'Change Password',
            onTap: () {},
            isArrowVisible: true,
          ),
          ExtrasMenuButton(
            icon: Assets.icons.textSize,
            menuTitle: 'Text Size',
            onTap: () {},
            label: "Medium",
          ),
          ExtrasMenuButton(
            icon: Assets.icons.notification,
            menuTitle: 'Notifications',
            onTap: () {
              showCustomBottomSheet(
                context: context,
                body: const CustomBottomSheet(body: NotificationBottomSheetMenu()),
              );
            },
            label: "All active",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              height: 1,
              thickness: 1,
            ),
          ),
          ExtrasMenuButton(
            icon: Assets.icons.logOut,
            iconColor: AppColors.errorColor.base,
            menuTitle: "Log Out",
            menuTitleColor: AppColors.errorColor.base,
            onTap: () {
              showCustomDialog(
                context: context,
                title: 'Log Out',
                contentText: Text(
                  'Are you sure you want to log \n out from the application?',
                  style: AppTextStyle.regularBase.copyWith(
                    color: AppColors.neutralColor.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                positive: "Yes",
                negative: "Cancel",
                onNegativeTap: () {
                  Navigator.pop(context);
                },
                onPositiveTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
