import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/presentation/pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';

import '../../config/constants/app_colors.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({
    Key? key,
    required this.onSelectedColor,
  }) : super(key: key);

  final Function(int selectedColorIndex) onSelectedColor;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddInterestingIdeaCubit, AddInterestingIdeaState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 32,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 40, mainAxisSpacing: 20),
            itemCount: colorPickerList.length,
            itemBuilder: (context, index) {
              final itemColor = colorPickerList[index];
              return GestureDetector(
                // Passing color index through function into main
                onTap: () => widget.onSelectedColor(index),
                // {
                //   context
                //       .read<AddInterestingIdeaCubit>()
                //       .changeBackgroundColor(index);
                // },
                child: Container(
                  height: 32,
                  width: 32,
                  padding: state.selectedColorIndex == index
                      ? const EdgeInsets.all(2)
                      : null,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: state.selectedColorIndex == index ? 2 : 0.5,
                      color: state.selectedColorIndex == index
                          ? AppColors.neutralColor.baseGrey
                          : AppColors.neutralColor.lightGrey,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: state.selectedColorIndex == index
                          ? Border.all(
                              width: 1, color: AppColors.neutralColor.baseGrey)
                          : null,
                      color: itemColor,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
