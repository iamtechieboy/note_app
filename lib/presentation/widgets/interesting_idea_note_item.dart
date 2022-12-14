import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';
import 'package:note_app/presentation/routes/routes.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class InterestingIdeaNoteItem extends StatelessWidget {
  const InterestingIdeaNoteItem({Key? key, required this.item, required this.onTap}) : super(key: key);

  final InterestingIdeaModel item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(12),
        decoration: AppDecoration.defDecor.copyWith(
          borderRadius: BorderRadius.circular(8),
          color: colorPickerList[item.itemColor!.toInt()],
          border: Border.all(
            width: 1,
            color: AppColors.neutralColor.lightGrey,
          ),
        ),
        height: 224,
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title!,
              style: AppTextStyle.mediumBase,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              item.noteBody!,
              style: AppTextStyle.regularXs.copyWith(color: AppColors.neutralColor.black.withOpacity(0.6)),
              overflow: TextOverflow.fade,
              maxLines: 11,
            ),
          ],
        ),
      ),
    );
  }
}
