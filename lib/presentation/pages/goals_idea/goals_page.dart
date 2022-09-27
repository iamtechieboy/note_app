import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/presentation/components/add_task_button.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/checkbox_component.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

import '../../components/title_text_field.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  List<CheckBoxesWidget> noteList = [CheckBoxesWidget()];

  late final TextEditingController titleEditingController;

  @override
  void initState() {
    titleEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              TitleTextField(
                titleHint: "Title Here",
                textEditingController: titleEditingController,
              ),
              ...noteList,
              AddTaskButton(
                label: "Add main task",
                onTap: () {
                  noteList.add(CheckBoxesWidget());
                  setState(() {});
                },
              ),
            ],
          ),
          BottomTaskBar(context: context),
        ],
      ),
    );
  }
}
