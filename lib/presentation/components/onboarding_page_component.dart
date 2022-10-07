import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';

class OnBoardingPageComponent extends StatefulWidget {
  OnBoardingPageComponent({super.key, required this.text, required this.text2});
  String text;
  String text2;
  @override
  State<OnBoardingPageComponent> createState() => _OnBoardingPageComponentState();
}

class _OnBoardingPageComponentState extends State<OnBoardingPageComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.base,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 128),
        child: Column(
          children: [
            Image.asset(
              widget.text2,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              widget.text,
              style: AppTextStyle.boldLg.copyWith(
                color: AppColors.neutralColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
