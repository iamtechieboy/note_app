import 'package:flutter/material.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/note_text_field.dart';

import '../../../config/constants/app_colors.dart';
import '../../components/title_text_field.dart';

class InterestingIdeaPage extends StatefulWidget {
  const InterestingIdeaPage({Key? key}) : super(key: key);

  @override
  State<InterestingIdeaPage> createState() => _InterestingIdeaPageState();
}

class _InterestingIdeaPageState extends State<InterestingIdeaPage> {
  late final TextEditingController titleEditingController;
  late final TextEditingController noteEditingController;

  @override
  void initState() {
    titleEditingController = TextEditingController();
    noteEditingController = TextEditingController();
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  TitleTextField(
                    titleHint: "Title Here",
                    textEditingController: titleEditingController,
                  ),
                  NoteTextField(textEditingController: noteEditingController),
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
