import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/components/checkbox_add_subtask.dart';

class CheckBoxesWidget extends StatefulWidget {
  const CheckBoxesWidget({super.key});

  @override
  State<CheckBoxesWidget> createState() => _CheckBoxesWidgetState();
}

class _CheckBoxesWidgetState extends State<CheckBoxesWidget> {
  bool isChecked = false;
  List<CheckBoxSubtaskWidget> checkNote = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
          ],
        ),
        ...checkNote,
        InkWell(
          onTap: () {
            checkNote.add(CheckBoxSubtaskWidget());
            setState(() {});
          },
          child: Container(
            height: 46,
            padding: const EdgeInsets.only(left: 44),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/plus.svg",
                  height: 20,
                  width: 20,
                  color: AppColors.primaryColor.base,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Add subtask",
                  style: AppTextStyle.mediumBase
                      .copyWith(decoration: TextDecoration.underline, color: AppColors.primaryColor.base),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}
