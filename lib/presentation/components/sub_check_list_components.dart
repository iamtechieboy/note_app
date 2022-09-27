import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';

class SubCheckListComponent extends StatefulWidget {
  const SubCheckListComponent({super.key});

  @override
  State<SubCheckListComponent> createState() => _SubCheckListComponentState();
}

class _SubCheckListComponentState extends State<SubCheckListComponent> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.dragHandler),
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
            fillColor: MaterialStateProperty.resolveWith((states) => AppColors.primaryColor.base),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: TextField(
              style: AppTextStyle.mediumBase,
              maxLines: 2,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "write a title here",
                hintStyle: AppTextStyle.mediumBase.copyWith(
                  color: AppColors.neutralColor.baseGrey,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.asset(
            Assets.icons.close,
            color: AppColors.neutralColor.baseGrey,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
