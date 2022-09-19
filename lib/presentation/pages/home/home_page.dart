import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/presentation/components/navigationButton.dart';
import 'package:note_app/presentation/routes/routes.dart';
import 'package:note_app/presentation/widgets/home_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.images.illustrationStart),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Start Your Journey",
                    style: AppTextStyle.boldXl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Every big step start with small step. \nNotes your first idea and start \n your journey!",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regularSm
                        .copyWith(color: AppColors.neutralColor.darkGrey),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 40),
              child: SvgPicture.asset(
                Assets.images.arrowIndicator,
                height: 110,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor.base,
          shape: const CircleBorder(),
          fixedSize: const Size.fromHeight(80),
        ),
        onPressed: () {
          Navigator.pushNamed(context, Routes.newIdeaPage);
        },
        child: SvgPicture.asset(
          Assets.icons.plus,
          height: 32,
          color: AppColors.neutralColor.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
