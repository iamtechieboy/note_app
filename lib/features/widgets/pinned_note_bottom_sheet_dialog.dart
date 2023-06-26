import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/assets.dart';

import '../../config/constants/app_text_style.dart';
import '../components/iconic_oval_button.dart';

class PinnedNoteBottomSheetDialog extends StatelessWidget {
  const PinnedNoteBottomSheetDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.illustrationPinned,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Notes Pinned Successfully',
                style: AppTextStyle.boldLg,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Text(
                'This note already displayed on\npinned section',
                style: AppTextStyle.regularBase.copyWith(
                  color: AppColors.neutralColor.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            IconicOvalButton(
              height: 38,
              text: 'Close',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
