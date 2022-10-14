import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/extras_menu_button.dart';
import 'package:note_app/presentation/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:note_app/presentation/pages/guidance_idea/bloc/guidance_cubit.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';

class EditFileBottomSheetMenu extends StatelessWidget {
  const EditFileBottomSheetMenu(
      {required this.bloc, this.isDeleteVisible = true, Key? key})
      : super(key: key);

  final EditProfileCubit bloc;
  final bool isDeleteVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExtrasMenuButton(
          menuTitle: "Camera",
          icon: Assets.icons.camera,
          onTap: () {
            bloc.openingCamera().then((value) => Navigator.pop(context));
          },
        ),
        ExtrasMenuButton(
          menuTitle: "Gallery",
          icon: Assets.icons.photo,
          onTap: () {
            bloc.openGallery().then((value) => Navigator.pop(context));
          },
        ),
        Visibility(
          visible: isDeleteVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
        ),
        Visibility(
          visible: isDeleteVisible,
          child: ExtrasMenuButton(
            icon: Assets.icons.delete,
            iconColor: AppColors.errorColor.base,
            menuTitle: "Delete",
            menuTitleColor: AppColors.errorColor.base,
            onTap: () {
              bloc.deleteingImage().then((value) => Navigator.pop(context));
            },
          ),
        ),
      ],
    );
  }
}
