import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/assets.dart';
import '../../../core/domain/entities/enums.dart';
import '../../components/bottom_task_bar.dart';
import '../../components/custom_app_bar.dart';
import '../../components/iconic_oval_button.dart';

class RoutineTaskPage extends StatefulWidget {
  const RoutineTaskPage({Key? key}) : super(key: key);

  @override
  State<RoutineTaskPage> createState() => _RoutineTaskPageState();
}

class _RoutineTaskPageState extends State<RoutineTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: CustomAppBar(
        iconicOvalButton: IconicOvalButton(
          text: "Add Sub Note",
          icon: Assets.icons.plus,
          iconPosition: IconPosition.left,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          onTap: () {
            debugPrint("Add sub note");
          },
        ),
        onBackTap: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container()),
          BottomTaskBar(context: context),
        ],
      ),
    );
  }
}
