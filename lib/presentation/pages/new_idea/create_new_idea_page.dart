import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/widgets/new_ideas_button.dart';

import '../../../config/constants/assets.dart';

class CreateNewIdeasPage extends StatelessWidget {
  const CreateNewIdeasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 54,
        backgroundColor: AppColors.neutralColor.white,
        elevation: 1,
        shadowColor: const Color(0xe5ffffff),
        centerTitle: true,
        title: Text(
          "New Notes",
          style: AppTextStyle.mediumBase
              .copyWith(color: AppColors.neutralColor.black),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, right: 4),
                child: SvgPicture.asset(
                  Assets.icons.backWithText,
                  color: AppColors.primaryColor.base,
                ),
              ),
              Text(
                "Back",
                style: AppTextStyle.mediumBase.copyWith(
                  color: AppColors.primaryColor.base,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              "What do you want to \nNotes?",
              style: AppTextStyle.boldXl,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: NewIdeasButton(
                title: "Interesting Idea",
                description: "Use free text area, feel free to write it all",
                icon: Assets.icons.interesting,
                iconBackground: AppColors.primaryColor.dark,
                cardBackground: AppColors.primaryColor.base,
                onTap: () {},
              ),
            ),
            NewIdeasButton(
              title: "Buying Something",
              description: "Use checklist, so you won’t miss anything",
              icon: Assets.icons.shoppingCart,
              iconBackground: AppColors.successColor.dark,
              cardBackground: AppColors.successColor.base,
              onTap: () {},
            ),
            NewIdeasButton(
              title: "Goals",
              description: "Near/future goals, notes and keep focus ",
              icon: Assets.icons.goals,
              iconBackground: AppColors.waringColors.dark,
              cardBackground: AppColors.waringColors.base,
              onTap: () {},
            ),
            NewIdeasButton(
              title: "Guidance",
              description: "Create guidance for routine activities",
              icon: Assets.icons.guidance,
              iconBackground: AppColors.errorColor.dark,
              cardBackground: AppColors.errorColor.base,
              onTap: () {},
            ),
            NewIdeasButton(
              title: "Routine Tasks",
              description: "Checklist with sub-checklist",
              icon: Assets.icons.routineTask,
              iconBackground: AppColors.secondaryColor.dark,
              cardBackground: AppColors.secondaryColor.base,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
