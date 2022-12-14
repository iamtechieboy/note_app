import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/presentation/components/back_to_button.dart';
import 'package:note_app/presentation/widgets/bloc/bottom_sheet_cubit.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';
import '../pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';

// Custom Bottom sheet body with close button
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.body,
    this.onBackTap,
    this.title,
  }) : super(key: key);

  final Widget body;
  final String? title;
  final Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        color: AppColors.primaryColor.background,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: title != null && title!.isNotEmpty,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 24,
                    child: BackToButton(
                      title: title ?? "Back",
                      onPressed: onBackTap ?? () {},
                    ),
                  ),
                ),
              ),
              // Close button for Bottom sheet
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.neutralColor.lightGrey),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // Close that bottom sheet
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                            Assets.icons.close,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Body comes by constructor
          body,
        ],
      ),
    );
  }
}
