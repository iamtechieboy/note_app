import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';

import '../../../../../core/utils/show_snack_bar_top.dart';
import '../../../components/bottom_task_bar.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/extras_menu_button.dart';
import '../../../components/iconic_oval_button.dart';
import '../../../components/sub_check_list_components.dart';
import '../../../components/sub_text_field_component.dart';
import '../../../components/title_text_field.dart';

class SubNotesAddPage extends StatefulWidget {
  const SubNotesAddPage({super.key});

  @override
  State<SubNotesAddPage> createState() => _SubNotesAddPageState();
}

class _SubNotesAddPageState extends State<SubNotesAddPage> {
  List<Widget> itemList = [];
  TextEditingController titleEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sub Notes List",
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 24),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TitleTextField(titleHint: "Title Here", textEditingController: titleEditingController),
                ),
                SizedBox(height: itemList.isEmpty ? 24 : 12),
                Flexible(
                  child: ReorderableListView.builder(
                    itemCount: itemList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildItem(index);
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final user = itemList.removeAt(oldIndex);
                        itemList.insert(newIndex, user);
                      });
                    },
                  ),
                ),
                itemList.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Divider(
                          height: 10,
                          color: AppColors.neutralColor.lightGrey,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    "ACTIONS",
                    style: AppTextStyle.mediumXs.copyWith(color: AppColors.neutralColor.darkGrey),
                  ),
                ),
                ExtrasMenuButton(
                  menuTitle: "Add Free Text Area",
                  icon: Assets.icons.edit,
                  menuTitleColor: AppColors.primaryColor.base,
                  iconColor: AppColors.primaryColor.base,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 46,
                  onTap: () {
                    itemList.add(const SubTextFieldAdd());
                    setState(() {});
                  },
                ),
                ExtrasMenuButton(
                  menuTitle: "Add Checklist",
                  icon: Assets.icons.check,
                  menuTitleColor: AppColors.primaryColor.base,
                  iconColor: AppColors.primaryColor.base,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 46,
                  onTap: () {
                    itemList.add(const SubCheckListComponent());
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Divider(
                    height: 10,
                    color: AppColors.neutralColor.lightGrey,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: Text(
                    "ATTACHMENTS",
                    style: AppTextStyle.mediumXs.copyWith(color: AppColors.neutralColor.darkGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "No file",
                    style: AppTextStyle.regularBase.copyWith(
                      color: AppColors.neutralColor.baseGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconicOvalButton(
                    height: 38,
                    text: 'Upload Attachment',
                    icon: Assets.icons.upload,
                    textColor: AppColors.primaryColor.base,
                    iconColor: AppColors.primaryColor.base,
                    boxDecoration: AppDecoration.outline,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomTaskBar(
            onTapDelete: () {},
            onTapPinNote: () {},
            isPinned: false,
          ),
        ],
      ),
    );
  }

  void remove(int index) => setState(
        () => itemList.removeAt(index),
      );

  Widget buildItem(int index) {
    return SizedBox(
      key: ValueKey(itemList[index].hashCode),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: itemList[index],
            ),
            InkWell(
              onTap: () {
                showCustomTopSnackBar(
                  context: context,
                  messages: RichText(
                    text: TextSpan(
                      text: "Your sub notes has been marked as\n",
                      style: AppTextStyle.regularSm.copyWith(color: AppColors.successColor.dark),
                      children: [
                        TextSpan(
                            text: "\"Completed\"",
                            style: AppTextStyle.boldSm.copyWith(color: AppColors.successColor.dark))
                      ],
                    ),
                  ),
                );
                remove(index);
              },
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                Assets.icons.close,
                color: AppColors.neutralColor.baseGrey,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addTextFieldAndCheck(String text, String text1) {
    return Container(
      height: 46,
      alignment: Alignment.center,
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/$text.svg",
            color: AppColors.primaryColor.base,
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text1,
            style: AppTextStyle.mediumLg.copyWith(
              color: AppColors.primaryColor.base,
            ),
          ),
        ],
      ),
    );
  }
}
