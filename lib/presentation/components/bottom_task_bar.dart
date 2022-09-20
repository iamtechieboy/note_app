import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/assets.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';

class BottomTaskBar extends StatelessWidget {
  const BottomTaskBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFEFEEF0),
          ),
        ),
      ),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Last edited on 19.30",
              style: AppTextStyle.regular2Xs,
            ),
          ),
          Row(
            children: [
              MaterialButton(
                minWidth: 48,
                height: 48,
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.icons.searchMenu,
                ),
              ),
              MaterialButton(
                minWidth: 48,
                height: 48,
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.icons.bookMark,
                ),
              ),
              MaterialButton(
                minWidth: 48,
                height: 48,
                color: AppColors.primaryColor.base,
                onPressed: () {},
                child: SvgPicture.asset(
                  Assets.icons.more,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
