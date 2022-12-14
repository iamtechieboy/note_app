import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/utils/bottom_sheet.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';
import 'package:note_app/presentation/pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../core/utils/show_dialog.dart';
import '../../core/utils/show_snack_bar_top.dart';
import '../widgets/extra_bottom_sheet_menu.dart';
import '../widgets/pinned_note_bottom_sheet_dialog.dart';

class BottomTaskBar extends StatefulWidget {
  const BottomTaskBar({Key? key, required this.onTapDelete, required this.onTapPinNote, required this.isPinned})
      : super(key: key);

  final bool isPinned;
  final Function() onTapDelete;
  final Function() onTapPinNote;

  @override
  State<BottomTaskBar> createState() => _BottomTaskBarState();
}

class _BottomTaskBarState extends State<BottomTaskBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.neutralColor.lightGrey,
          ),
        ),
      ),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              context.read<BottomSheetCubit>().state.lastEditTime.isNotEmpty
                  ? "Last edited on ${context.read<BottomSheetCubit>().state.lastEditTime}"
                  : "Last edited recently",
              style: AppTextStyle.regular2Xs,
            ),
          ),
          Row(
            children: [
              // Search button
              // MaterialButton(
              //   minWidth: 48,
              //   height: 48,
              //   onPressed: () {},
              //   child: SvgPicture.asset(
              //     Assets.icons.searchMenu,
              //   ),
              // ),
              // Set bookmark button
              MaterialButton(
                minWidth: 48,
                height: 48,
                onPressed: () {
                  widget.onTapPinNote();
                  // showCustomBottomSheet(
                  //   context: context,
                  //   body: const CustomBottomSheet(
                  //     body: PinnedNoteBottomSheetDialog(),
                  //   ),
                  // );
                },
                child: SvgPicture.asset(
                  widget.isPinned ? Assets.icons.bookMarkFilled : Assets.icons.bookMark,
                  color: AppColors.primaryColor.base,
                ),
              ),
              // Show more button
              MaterialButton(
                minWidth: 48,
                height: 48,
                color: AppColors.primaryColor.base,
                onPressed: () {
                  showCustomBottomSheet(
                    context: context,
                    body: ExtrasBottomSheetMenuBody(
                      onTapFinished: () {
                        Navigator.pop(context);
                        showCustomDialog(
                          context: context,
                          title: 'Finished!',
                          contentText: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Your notes mark as finished,\n',
                              style: AppTextStyle.regularBase.copyWith(
                                color: AppColors.neutralColor.darkGrey,
                              ),
                              children: const [
                                TextSpan(text: 'and already moved to the\n'),
                                TextSpan(text: '"Finished Notes"', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' menu.'),
                              ],
                            ),
                          ),
                          icon: Assets.icons.check,
                          iconBackgroundColor: AppColors.successColor.light,
                          iconColor: AppColors.successColor.dark,
                          positive: "Close",
                          onPositiveTap: () {
                            Navigator.pop(context);
                            showCustomTopSnackBar(
                              context: context,
                              messages: RichText(
                                text: TextSpan(
                                  style: AppTextStyle.regularBase.copyWith(
                                    color: AppColors.neutralColor.darkGrey,
                                  ),
                                  text: 'This notes already moved to',
                                  children: const [
                                    TextSpan(
                                      text: ' "Finished Notes"',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          negative: "Undo",
                          onNegativeTap: () {
                            Navigator.pop(context);
                            showCustomTopSnackBar(
                              context: context,
                              messages: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: 'Undo Success! ',
                                  style: AppTextStyle.regularBase
                                      .copyWith(color: AppColors.neutralColor.darkGrey, fontWeight: FontWeight.bold),
                                  children: const [
                                    TextSpan(
                                      text: 'This note still displayed on the',
                                      style: TextStyle(fontWeight: FontWeight.normal),
                                    ),
                                    TextSpan(
                                      text: ' "Interesting ideas"',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      onTapDelete: () {
                        Navigator.pop(context);
                        widget.onTapDelete();
                      },
                    ),
                  ).then((value) {
                    context.read<BottomSheetCubit>().navigateTo(0);
                    context.read<BottomSheetCubit>().changeVisibility(context);
                  });
                },
                child: SvgPicture.asset(
                  Assets.icons.more,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
