import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';

class CheckBoxWithTextField extends StatefulWidget {
  const CheckBoxWithTextField({
    super.key,
    required this.hintText,
    this.padding,
  });

  @override
  State<CheckBoxWithTextField> createState() => _CheckBoxWithTextFieldState();

  final String hintText;
  final EdgeInsets? padding;
}

class _CheckBoxWithTextFieldState extends State<CheckBoxWithTextField> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(
                width: 1,
              ),
              checkColor: AppColors.neutralColor.white,
              fillColor: MaterialStateProperty.resolveWith(
                  (states) => AppColors.primaryColor.base),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: TextField(
                style: AppTextStyle.mediumBase,
                maxLines: 2,
                cursorHeight: 20,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                autocorrect: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyle.mediumBase.copyWith(
                    color: AppColors.neutralColor.baseGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
