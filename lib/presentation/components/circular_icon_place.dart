import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_decoration.dart';

class CircularIconPlace extends StatelessWidget {
  const CircularIconPlace({
    Key? key,
    required this.height,
    required this.icon,
    required this.iconColor,
    required this.background,
    this.iconHeight,
  }) : super(key: key);

  final double height;
  final String icon;
  final double? iconHeight;
  final Color iconColor;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: height / 2,
      backgroundColor: background,
      child: SvgPicture.asset(
        icon,
        color: iconColor,
        height: iconHeight ?? 32,
      ),
    );
  }
}
