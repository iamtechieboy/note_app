import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/components/add_task_button.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/checkbox_component.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  List<CheckBoxesWidget> noteList = [CheckBoxesWidget()];

  bool isChecked = false;

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
                    SizedBox(
                      width: size.width - 32,
                      child: Flexible(
                        child: TextFormField(
                          style: AppTextStyle.bold2Xl,
                          maxLines: null,
                          minLines: null,
                          keyboardType: TextInputType.multiline,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Title Here",
                            hintStyle: AppTextStyle.bold2Xl.copyWith(
                              color: AppColors.neutralColor.baseGrey,
                            ),
                          ),
                        ),
                      ),
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
