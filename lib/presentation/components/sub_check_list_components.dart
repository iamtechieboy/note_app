import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/presentation/components/checkbox_with_textfield.dart';

class SubCheckListComponent extends StatefulWidget {
  const SubCheckListComponent({super.key});

  @override
  State<SubCheckListComponent> createState() => _SubCheckListComponentState();
}

class _SubCheckListComponentState extends State<SubCheckListComponent> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.icons.dragHandler),
        const Expanded(
          child: CheckBoxWithTextField(
            hintText: "Write notes here",
          ),
        ),
      ],
    );
  }
}
