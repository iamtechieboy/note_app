import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

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

  List<CheckBoxWithTextField> checkNote = [];

  @override
  void initState() {
    titleEditController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                children: [
                  TitleTextField(
                    titleHint: "Title Here",
                    textEditingController: titleEditController,
                  ),
                  // part of lists
                  const CheckBoxWithTextField(
                    hintText: "Write your notes here",
                  ),
                  ...checkNote,
                  // adding new checkbox to the list
                  AddTaskButton(
                    label: "Add checkbox",
                    onTap: () {
                      checkNote.add(
                        const CheckBoxWithTextField(
                          hintText: "Write your task notes here",
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),
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
