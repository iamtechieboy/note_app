import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';

import '../../../components/add_task_button.dart';
import '../../../components/bottom_task_bar.dart';
import '../../../components/checkbox_component.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/title_text_field.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  List<CheckBoxesWidget> noteList = [const CheckBoxesWidget()];

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
      appBar: CustomAppBar(onBackTap: () => Navigator.pop(context)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TitleTextField(
                    titleHint: "Title Here",
                    textEditingController: titleEditingController,
                  ),
                ),
                ...noteList,
                AddTaskButton(
                  padding: const EdgeInsets.only(left: 23),
                  label: "Add main task",
                  onTap: () {
                    noteList.add(const CheckBoxesWidget());
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          BottomTaskBar(onTapDelete: () {  }, onTapPinNote: (){}, isPinned: false,),
        ],
      ),
    );
  }
}
