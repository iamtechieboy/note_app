import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/config/constants/app_colors.dart';

import '../../config/constants/app_colors.dart';
import 'bloc/bottom_sheet_cubit.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({
    Key? key,
  }) : super(key: key);


  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetInitialState>(
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
                onTap: () {
                  context.read<BottomSheetCubit>().changeBgColor(index);
                },
                child: Container(
                  height: 32,
                  width: 32,
                  padding: state.colorIndex == index
                      ? const EdgeInsets.all(3)
                      : null,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: state.colorIndex == index ? 2 : 1,
                      color: state.colorIndex == index
                          ? AppColors.neutralColor.baseGrey
                          : AppColors.neutralColor.lightGrey,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: state.colorIndex == index
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
