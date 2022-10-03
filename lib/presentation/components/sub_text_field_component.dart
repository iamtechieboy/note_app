import 'package:flutter/material.dart';
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.icons.dragHandler),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: TextField(
            style: AppTextStyle.regularBase
                .copyWith(color: AppColors.neutralColor.darkGrey),
            maxLines: null,
            minLines: null,
            keyboardType: TextInputType.multiline,
            autocorrect: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Write notes here",
              hintStyle: AppTextStyle.regularBase
                  .copyWith(color: AppColors.neutralColor.baseGrey),
            ),
          ),
        ),
        const SizedBox(
          width: 14,
        ),
      ],
    );
  }
}
