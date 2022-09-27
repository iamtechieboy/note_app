import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    Key? key,
    required this.titleHint,
    required this.textEditingController,
  }) : super(key: key);

  final String titleHint;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        controller: textEditingController,
        style: AppTextStyle.bold2Xl,
        maxLines: null,
        minLines: null,
        keyboardType: TextInputType.multiline,
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: titleHint,
          hintStyle: AppTextStyle.bold2Xl.copyWith(
            color: AppColors.neutralColor.baseGrey,
          ),
        ),
      ),
    );
  }
}
