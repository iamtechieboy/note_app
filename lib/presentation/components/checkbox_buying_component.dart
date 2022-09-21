import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/add_task_button.dart';
import 'package:note_app/presentation/components/checkbox_with_textfield.dart';

class CHeckBoxesBuyingSomethingWidget extends StatefulWidget {
  const CHeckBoxesBuyingSomethingWidget({super.key});

  @override
  State<CHeckBoxesBuyingSomethingWidget> createState() => _CHeckBoxesBuyingSomethingWidgetState();
}

class _CHeckBoxesBuyingSomethingWidgetState extends State<CHeckBoxesBuyingSomethingWidget> {
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
        AddTaskButton(
          label: "Add  subtask",
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
    );
  }
}
