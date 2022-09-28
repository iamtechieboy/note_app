import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';

class SubTextFieldAdd extends StatefulWidget {
  const SubTextFieldAdd({super.key});

  @override
  State<SubTextFieldAdd> createState() => _SubTextFieldAddState();
}

class _SubTextFieldAddState extends State<SubTextFieldAdd> {  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SvgPicture.asset(Assets.icons.dragHandler),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: TextField(
              style: AppTextStyle.mediumBase,
              maxLines: null,
              minLines: null,
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
        const SizedBox(
          width: 14,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 15),
        //   child: InkWell(
        //     onTap: () {

        //     },
        //     borderRadius: BorderRadius.circular(10),
        //     child: SvgPicture.asset(
        //       Assets.icons.close,
        //       color: AppColors.neutralColor.baseGrey,
        //       height: 20,
        //       width: 20,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
