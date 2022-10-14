import 'package:flutter/material.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.hintText,
    required this.keyboardInputType,
    required this.controller,
  }) : super(key: key);

  final String label;
  final String hintText;
  final TextInputType keyboardInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.mediumBase,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextField(
            controller: controller,
            // bu yerga controller joylanadi
            minLines: 1,
            maxLines: 1,
            style: AppTextStyle.regularBase,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: AppTextStyle.regularBase
                  .copyWith(color: AppColors.neutralColor.baseGrey),
              fillColor: AppColors.neutralColor.baseGrey,
            ),
            keyboardType: keyboardInputType,
          ),
        ),
      ],
    );
    ;
  }
}
