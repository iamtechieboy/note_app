import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/extras_menu_button.dart';

import '../../../config/constants/app_colors.dart';

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
      appBar: const CustomAppBar(title: "Settings"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  child: Image.asset(Assets.images.userSettings),
                ),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6.5),
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
                            width: 15,
                            height: 15,
                            color: AppColors.neutralColor.darkGrey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "anto_michael@gmail.com",
                            style: AppTextStyle.regular2Xs.copyWith(
                                color: AppColors.neutralColor.darkGrey),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: AppColors.primaryColor.base)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.edit,
                        width: 20,
                        height: 20,
                        color: AppColors.primaryColor.base,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Edit Profile",
                        style: AppTextStyle.mediumBase
                            .copyWith(color: AppColors.primaryColor.base),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Divider(
                color: AppColors.neutralColor.lightGrey,
                height: 1,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "APP SETTINGS",
                style: AppTextStyle.regularXs
                    .copyWith(color: AppColors.neutralColor.darkGrey),
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
                showMaterialModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) => const SettingsBottomSheetBody(),
                );
              },
              label: "All active",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    actionsPadding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 24),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    alignment: Alignment.center,
                    title: Text(
                      'Log Out',
                      style: AppTextStyle.boldLg,
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      'Are you sure you want to log \n out from the application?',
                      style: AppTextStyle.regularBase
                          .copyWith(color: AppColors.neutralColor.darkGrey),
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: AppColors.primaryColor.base)),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Cancel',
                                  style: AppTextStyle.mediumBase.copyWith(
                                      color: AppColors.primaryColor.base),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: AppColors.primaryColor.base),
                                  child: Text(
                                    'Yes',
                                    style: AppTextStyle.mediumBase.copyWith(
                                        color: AppColors.neutralColor.white),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsBottomSheetBody extends StatefulWidget {
  const SettingsBottomSheetBody({super.key});

  @override
  State<SettingsBottomSheetBody> createState() =>
      _SettingsBottomSheetBodyState();
}

class _SettingsBottomSheetBodyState extends State<SettingsBottomSheetBody> {
  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryColor.light;
      }
      return null;
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primaryColor.base;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColors.primaryColor.dark;
      }
      return null;
    },
  );
  bool isEmailChecked = true;
  bool isPushChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      height: 176,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close button for Bottom sheet
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.neutralColor.lightGrey),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      // Close that bottom sheet
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        Assets.icons.close,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Change note background text
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child:
                  settingNotifications("Email Notifications", isEmailChecked),
            ),
            settingNotifications("Push Notifications", isPushChecked)
          ],
        ),
      ),
    );
  }

  Row settingNotifications(String text, bool isChecked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            text,
            style: AppTextStyle.mediumBase
                .copyWith(color: AppColors.neutralColor.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            mouseCursor: MouseCursor.uncontrolled,
            splashRadius: 8,
            trackColor: trackColor,
            thumbColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor.base),
            value: isChecked,
            onChanged: (bool value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
