import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';

class CheckBoxSubtaskWidget extends StatefulWidget {
  const CheckBoxSubtaskWidget({super.key});

  @override
  State<CheckBoxSubtaskWidget> createState() => _CheckBoxSubtaskWidgetState();
}

class _CheckBoxSubtaskWidgetState extends State<CheckBoxSubtaskWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 5,
      ),
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
              fillColor: MaterialStatePropertyAll(AppColors.neutralColor.baseGrey),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: TextField(
                style: AppTextStyle.boldBase,
                maxLines: 2,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                autocorrect: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write your notes here",
                  hintStyle: AppTextStyle.boldBase.copyWith(
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
