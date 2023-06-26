import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';
import '../components/extras_menu_button.dart';
import '../guidance_idea/presentation/bloc/guidance_cubit.dart';

class EditPhotoBottomSheetMenu extends StatelessWidget {
  const EditPhotoBottomSheetMenu({required this.bloc, Key? key})
      : super(key: key);
  final GuidanceCubit bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExtrasMenuButton(
          menuTitle: "Camera",
          icon: Assets.icons.camera,
          onTap: () {
            bloc.openCamera().then((value) => Navigator.pop(context));
          },
        ),
        ExtrasMenuButton(
          menuTitle: "Gallery",
          icon: Assets.icons.photo,
          onTap: () {
            bloc.openGallery().then((value) => Navigator.pop(context));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            color: AppColors.neutralColor.lightGrey,
            thickness: 1,
            height: 1,
          ),
        ),
        ExtrasMenuButton(
          icon: Assets.icons.delete,
          iconColor: AppColors.errorColor.base,
          menuTitle: "Delete",
          menuTitleColor: AppColors.errorColor.base,
          onTap: () {
            bloc.deleteImage().then((value) => Navigator.pop(context));
          },
        ),
      ],
    );
  }
}
