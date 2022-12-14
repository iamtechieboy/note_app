import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/routes/routes.dart';
import 'package:note_app/presentation/components/new_ideas_button.dart';

import '../../../config/constants/assets.dart';

class CreateNewIdeasPage extends StatelessWidget {
  const CreateNewIdeasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: CustomAppBar(title: "New Ideas", onBackTap: () => Navigator.pop(context)),
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
                onTap: () {
                  Navigator.pushNamed(context, Routes.interestingIdeaPage,
                      arguments: {'model': InterestingIdeaModel(), 'index': -1});
                },
              ),
            ),
            NewIdeasButton(
              title: "Buying Something",
              description: "Use checklist, so you won’t miss anything",
              icon: Assets.icons.shoppingCart,
              iconBackground: AppColors.successColor.dark,
              cardBackground: AppColors.successColor.base,
              onTap: () {
                Navigator.pushNamed(context, Routes.buyingSomethingPage);
              },
            ),
            NewIdeasButton(
              title: "Goals",
              description: "Near/future goals, notes and keep focus ",
              icon: Assets.icons.goals,
              iconBackground: AppColors.waringColors.dark,
              cardBackground: AppColors.waringColors.base,
              onTap: () {
                Navigator.pushNamed(context, Routes.goalsPage);
              },
            ),
            NewIdeasButton(
              title: "Guidance",
              description: "Create guidance for routine activities",
              icon: Assets.icons.guidance,
              iconBackground: AppColors.errorColor.dark,
              cardBackground: AppColors.errorColor.base,
              onTap: () {
                Navigator.pushNamed(context, Routes.guidancePage);
              },
            ),
            NewIdeasButton(
              title: "Routine Tasks",
              description: "Checklist with sub-checklist",
              icon: Assets.icons.routineTask,
              iconBackground: AppColors.secondaryColor.dark,
              cardBackground: AppColors.secondaryColor.base,
              onTap: () {
                Navigator.pushNamed(context, Routes.routineTaskPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
