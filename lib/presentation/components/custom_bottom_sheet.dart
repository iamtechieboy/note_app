import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/assets.dart';
import '../pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';

// Custom Bottom sheet body with close button
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.body,
    required this.height,
  }) : super(key: key);

  final Widget body;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        color: colorPickerList[
            context.watch<AddInterestingIdeaCubit>().state.selectedColorIndex],
      ),
      padding: const EdgeInsets.all(16),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Close button for Bottom sheet
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.neutralColor.lightGrey),
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
          // Body comes by constructor
          body,
        ],
      ),
    );
  }
}
