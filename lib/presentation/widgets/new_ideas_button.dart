import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';

class NewIdeasButton extends StatelessWidget {
  const NewIdeasButton({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBackground,
    required this.cardBackground,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String description;
  final String icon;
  final Color iconBackground;
  final Color cardBackground;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardBackground,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                height: 46,
                width: 46,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: iconBackground,
                ),
                child: SvgPicture.asset(
                  icon,
                  width: 22,
                  height: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.boldBase
                          .copyWith(color: AppColors.neutralColor.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        description,
                        style: AppTextStyle.regular2Xs
                            .copyWith(color: AppColors.neutralColor.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
