import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

import '../../../config/constants/app_colors.dart';
import '../../components/add_task_button.dart';
import '../../components/checkbox_with_textfield.dart';
import '../../components/title_text_field.dart';

class BuyingSomethingPage extends StatefulWidget {
  const BuyingSomethingPage({super.key});

  @override
  State<BuyingSomethingPage> createState() => _BuyingSomethingPageState();
}

class _BuyingSomethingPageState extends State<BuyingSomethingPage> {
  late final TextEditingController titleEditController;

  List<CheckBoxWithTextField> checkNote = [
    const CheckBoxWithTextField(
      hintText: "Write your task notes here",
      padding: EdgeInsets.symmetric(horizontal: 16),
    )
  ];

  @override
  void initState() {
    titleEditController = TextEditingController();
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TitleTextField(
                    titleHint: "Title Here",
                    textEditingController: titleEditController,
                  ),
                ),
                ...checkNote,
                // adding new checkbox to the list
                AddTaskButton(
                  padding: EdgeInsets.only(left: 23),
                  label: "Add checkbox",
                  onTap: () {
                    checkNote.add(
                      const CheckBoxWithTextField(
                        hintText: "Write your task notes here",
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    );
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          BottomTaskBar(
            context: context,
          ),
        ],
      ),
    );
  }
}
