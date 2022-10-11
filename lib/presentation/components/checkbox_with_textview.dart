import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';

class CheckBoxWithTextView extends StatefulWidget {
  CheckBoxWithTextView(
      {super.key,
      required this.label,
      this.padding,
      required this.onTap,
      this.isChecked = false});

  @override
  State<CheckBoxWithTextView> createState() => _CheckBoxWithTextViewState();

  final String label;
  final EdgeInsets? padding;
  final Function(String week) onTap;
  bool isChecked = false;
}

class _CheckBoxWithTextViewState extends State<CheckBoxWithTextView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onTap(widget.label);
          widget.isChecked = !widget.isChecked;
          setState(() {});
        },
        child: Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: widget.isChecked,
                  onChanged: (value) {
                    widget.onTap(widget.label);
                    widget.isChecked = !widget.isChecked;
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: const BorderSide(
                    width: 1,
                  ),
                  checkColor: AppColors.neutralColor.white,
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.primaryColor.base),
                ),
              ),
              Expanded(
                child: Text(
                  widget.label,
                  style: AppTextStyle.mediumBase,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
