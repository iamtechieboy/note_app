import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

import '../../../config/constants/app_colors.dart';
import '../../components/title_text_field.dart';

class InterestingIdeaPage extends StatefulWidget {
  const InterestingIdeaPage({Key? key}) : super(key: key);

  @override
  State<InterestingIdeaPage> createState() => _InterestingIdeaPageState();
}

class _InterestingIdeaPageState extends State<InterestingIdeaPage> {
  late final TextEditingController titleEditController;

  @override
  void initState() {
    titleEditController = TextEditingController();
    super.initState();
  }

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
                  TitleTextField(
                    titleHint: "Title Here",
                    textEditingController: titleEditController,
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
          BottomTaskBar(context: context),
        ],
      ),
    );
  }
}
