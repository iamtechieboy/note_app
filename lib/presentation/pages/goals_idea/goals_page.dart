import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
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

  late final TextEditingController titleEditControl;

  @override
  void initState() {
    titleEditControl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    TitleTextField(
                      titleHint: "Title Here",
                      textEditingController: titleEditControl,
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
              ),
            ),
          ),
          BottomTaskBar(context: context),
        ],
      ),
    );
  }
}
