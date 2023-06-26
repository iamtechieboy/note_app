import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    Key? key,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    required this.textEditingController,
  }) : super(key: key);

  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            child: TextFormField(
              controller: textEditingController,
              style: textStyle ?? AppTextStyle.regularBase.copyWith(color: AppColors.neutralColor.darkGrey),
              maxLines: null,
              minLines: null,
              keyboardType: TextInputType.multiline,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write your notes here...",
                hintStyle: hintStyle ??
                    AppTextStyle.regularBase.copyWith(
                      color: AppColors.neutralColor.baseGrey,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
