import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/add_task_button.dart';
import 'package:note_app/presentation/components/checkbox_with_textfield.dart';

class CheckBoxesWidget extends StatefulWidget {
  const CheckBoxesWidget({super.key});

  @override
  State<CheckBoxesWidget> createState() => _CheckBoxesWidgetState();
}

class _CheckBoxesWidgetState extends State<CheckBoxesWidget> {
  bool isChecked = false;
  List<CheckBoxWithTextField> checkNote = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CheckBoxWithTextField(
          hintText: "Write your notes here",
        ),
        ...checkNote,
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 5,
          ),
          child: AddTaskButton(
            label: "Add  subtask",
            onTap: () {
              checkNote.add(
                const CheckBoxWithTextField(
                  hintText: "Write your task notes here",
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 5,
                  ),
                ),
              );
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
