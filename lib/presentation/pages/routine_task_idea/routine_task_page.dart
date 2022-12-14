import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_style.dart';
import '../../../config/constants/assets.dart';
import '../../../core/domain/entities/enums.dart';
import '../../components/bottom_task_bar.dart';
import '../../components/circular_icon_place.dart';
import '../../components/custom_app_bar.dart';
import '../../components/iconic_oval_button.dart';
import '../../routes/routes.dart';

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
        iconicOvalButton: Visibility(
          visible: false,
          child: IconicOvalButton(
            text: "Add Sub Note",
            icon: Assets.icons.plus,
            iconPosition: IconPosition.left,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onTap: () {
              Navigator.pushNamed(context, Routes.subNotesPage);
            },
          ),
        ),
        onBackTap: () => Navigator.pop(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: DottedBorder(
              dashPattern: const [12, 12],
              strokeWidth: 1.3,
              color: AppColors.neutralColor.baseGrey,
              borderType: BorderType.RRect,
              radius: const Radius.circular(15),
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  alignment: Alignment.center,
                  height: 280,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularIconPlace(
                        height: 58,
                        icon: Assets.icons.edit,
                        iconColor: AppColors.primaryColor.base,
                        background: AppColors.primaryColor.light,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 20),
                        child: SizedBox(
                          width: 240,
                          child: Text(
                            "Your sub notes will be displayed \n here. Add your first sub notes.",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.mediumSm.copyWith(
                              color: AppColors.neutralColor.baseGrey,
                            ),
                          ),
                        ),
                      ),
                      IconicOvalButton(
                        height: 38,
                        text: "Add Sub Note",
                        icon: Assets.icons.plus,
                        iconPosition: IconPosition.left,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.subNotesPage);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomTaskBar(onTapDelete: () {  }, onTapPinNote: () {}, isPinned: false,),
        ],
      ),
    );
  }
}
