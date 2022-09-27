import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/sub_check_list_components.dart';
import 'package:note_app/presentation/components/sub_text_field_component.dart';

class SubNotesList extends StatefulWidget {
  const SubNotesList({super.key});

  @override
  State<SubNotesList> createState() => _SubNotesListState();
}

class _SubNotesListState extends State<SubNotesList> {
  List<Widget> subCheckList = [];
  // List<SubTextFieldAdd> subTextFieldAdd = [];
  List items = [
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item6",
    "item7",
    "item8",
    "item9",
    "item10",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      height: 10,
                      color: AppColors.neutralColor.baseGrey,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),

                  SizedBox(
                    height: subCheckList.length * 46,
                    child: Expanded(
                      child: ReorderableListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildUser(index);
                        },
                        itemCount: subCheckList.length,
                        onReorder: (oldIndex, newIndex) {
                          setState(() {
                            final index = newIndex;

                            final user = subCheckList.removeAt(oldIndex);

                            items.insert(index, user);
                          });
                        },
                      ),
                    ),
                  ),

                  // return Scaffold(
                  //   body: ReorderableListView.builder(
                  //     itemBuilder: (context, index) {
                  //       final user = items[index];
                  //       return buildUser(index, user);
                  //     },
                  //     itemCount: items.length,
                  //     onReorder: (oldIndex, newIndex) {
                  //       setState(() {
                  //         final index = newIndex;

                  //         final user = items.removeAt(oldIndex);

                  //         items.insert(index, user);
                  //       });
                  //     },
                  //   ),
                  // );

                  // ...subCheckList,

                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: subCheckList.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              height: 10,
                              color: AppColors.neutralColor.baseGrey,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  actionsAttachFunc("ACTIONS"),
                  InkWell(
                    onTap: () {
                      subCheckList.add(SubTextFieldAdd(
                        key: ValueKey(subCheckList.length),
                      ));
                      setState(() {});
                    },
                    child: addTextFieldAndCheck(
                      "edit",
                      "Add Free Text Area",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      subCheckList.add(SubCheckListComponent(
                        key: ValueKey(subCheckList.length),
                      ));
                      setState(() {});
                    },
                    child: addTextFieldAndCheck(
                      "check",
                      "Add Checklist",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 46,
                      width: 220,
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
                ],
              ),
            ),
          ),
          BottomTaskBar(context: context),
        ],
      ),
    );

    // return Scaffold(
    //   body: ReorderableListView.builder(
    //     itemBuilder: (context, index) {
    //       final user = items[index];
    //       return buildUser(index, user);
    //     },
    //     itemCount: items.length,
    //     onReorder: (oldIndex, newIndex) {
    //       setState(() {
    //         final index = newIndex;

    //         final user = items.removeAt(oldIndex);

    //         items.insert(index, user);
    //       });
    //     },
    //   ),
    // );
  }

  // Widget buildUser(int index, String user) {
  //   return ListTile(
  //     key: ValueKey(user),
  //     title: Text(user),
  //     trailing: IconButton(
  //       icon: const Icon(
  //         Icons.delete,
  //         color: Colors.black,
  //       ),
  //       onPressed: () => remove(index),
  //     ),
  //   );
  // }

  void remove(int index) => setState(
        () => items.removeAt(index),
      );

  Widget buildUser(int index) {
    return subCheckList[index];
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

  Widget actionsAttachFunc(String text) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 46,
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: AppTextStyle.bold2Xs.copyWith(
            color: AppColors.neutralColor.baseGrey,
          ),
        ),
      ),
    );
  }
}
