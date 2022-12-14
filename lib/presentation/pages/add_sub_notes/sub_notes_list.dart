import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/sub_check_list_components.dart';
import 'package:note_app/presentation/components/sub_text_field_component.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SubNotesList extends StatefulWidget {
  const SubNotesList({super.key});

  @override
  State<SubNotesList> createState() => _SubNotesListState();
}

class _SubNotesListState extends State<SubNotesList> {
  List<Widget> subCheckList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Sub Notes List",
        onBackTap: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 24),
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Divider(
                    height: 10,
                    color: AppColors.neutralColor.baseGrey,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
                ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final user = subCheckList[index].hashCode;
                    return buildUser(index, user);
                  },
                  itemCount: subCheckList.length,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final user = subCheckList.removeAt(oldIndex);
                      subCheckList.insert(newIndex, user);
                    });
                  },
                ),
                subCheckList.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                        child: Divider(
                          height: 10,
                          color: AppColors.neutralColor.baseGrey,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                      )
                    : const SizedBox.shrink(),
                actionsAttachFunc("ACTIONS"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {
                      subCheckList.add(SubTextFieldAdd(
                        key: ValueKey("userKey ${subCheckList.length - 1}"),
                      ));
                      setState(() {});
                    },
                    child: addTextFieldAndCheck(
                      "edit",
                      "Add Free Text Area",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {
                      subCheckList.add(SubCheckListComponent(
                        key: ValueKey("userKey ${subCheckList.length - 1}"),
                      ));
                      setState(() {});
                    },
                    child: addTextFieldAndCheck(
                      "check",
                      "Add Checklist",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 16,
                    right: 16,
                  ),
                  child: Divider(
                    height: 10,
                    color: AppColors.neutralColor.baseGrey,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
                actionsAttachFunc("ATTACHMENTS"),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 46,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "No file",
                      style: AppTextStyle.mediumBase.copyWith(
                        color: AppColors.neutralColor.baseGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: size.width * 0.4),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 46,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 2,
                          color: AppColors.primaryColor.base,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.icons.upload,
                            color: AppColors.primaryColor.base,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Upload Attachment",
                            style: AppTextStyle.mediumBase.copyWith(
                              color: AppColors.primaryColor.base,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomTaskBar(onTapDelete: () {}, onTapPinNote: () {}, isPinned: false),
        ],
      ),
    );
  }

  void showCustomFlushbar(BuildContext context) {}

  void remove(int index) => setState(
        () => subCheckList.removeAt(index),
      );

  Widget buildUser(int index, int user) {
    return ListTile(
      key: ValueKey(user),
      title: subCheckList[index],
      trailing: InkWell(
        onTap: () {
          remove(index);
          snackBarTop("Your notes section has been deleted");
        },
        borderRadius: BorderRadius.circular(10),
        child: SvgPicture.asset(
          Assets.icons.close,
          color: AppColors.neutralColor.baseGrey,
          height: 20,
          width: 20,
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

  snackBarTop(String messages) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        iconPositionLeft: 10,
        icon: Container(
          height: 32,
          width: 32,
          margin: const EdgeInsets.symmetric(
            vertical: 31,
          ),
          decoration: BoxDecoration(
            color: AppColors.successColor.base,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Transform.scale(
            scale: 0.5,
            child: SvgPicture.asset(
              Assets.icons.check,
              color: AppColors.successColor.dark,
              height: 5,
              width: 5,
            ),
          ),
        ),
        iconRotationAngle: 0,
        messagePadding: const EdgeInsets.only(
          left: 68,
          right: 16,
        ),
        message: RichText(
          text: TextSpan(text: messages),
        ),
        textStyle: AppTextStyle.mediumSm.copyWith(
          color: AppColors.successColor.dark,
        ),
        backgroundColor: AppColors.successColor.light,
      ),
    );
  }

  Widget actionsAttachFunc(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 46,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppTextStyle.bold2Xs.copyWith(
          color: AppColors.neutralColor.baseGrey,
        ),
      ),
    );
  }
}
