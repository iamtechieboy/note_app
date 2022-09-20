import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/assets.dart';

class AddInterestingIdeaPage extends StatefulWidget {
  const AddInterestingIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddInterestingIdeaPage> createState() => _AddInterestingIdeaPageState();
}

class _AddInterestingIdeaPageState extends State<AddInterestingIdeaPage> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
                  SizedBox(
                    width: size.width - 32,
                    child: Flexible(
                      child: TextFormField(
                        style: AppTextStyle.regularBase
                            .copyWith(color: AppColors.neutralColor.darkGrey),
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write your notes here...",
                          hintStyle: AppTextStyle.regularBase.copyWith(
                            color: AppColors.neutralColor.baseGrey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const BottomTaskBar()
        ],
      ),
    );
  }
}
