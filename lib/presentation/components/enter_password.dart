import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({super.key, required this.widthPasswordContainer});

  double widthPasswordContainer;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _showEye = false;
  bool _passwordIsEncryped = true;

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: AppTextStyle.mediumBase,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            height: 54,
            child: Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  labelText: "********",
                  labelStyle: AppTextStyle.regularBase.copyWith(
                    color: AppColors.neutralColor.baseGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.neutralColor.baseGrey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.neutralColor.baseGrey,
                      width: 1,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: _showEye
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _passwordIsEncryped = !_passwordIsEncryped;
                            });
                          },
                          child: _passwordIsEncryped
                              ? Container(
                                  width: 25,
                                  height: 25,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    Assets.icons.eye,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  width: 25,
                                  height: 25,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    Assets.icons.eyeOff,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        )
                      : null,
                ),
                obscureText: _showEye ? _passwordIsEncryped : true,
                onChanged: (value) {
                  password = value;
                  if (value.isEmpty) {
                    setState(() {
                      _showEye = false;
                    });
                  } else {
                    if (!_showEye) {
                      setState(() {
                        _showEye = !_showEye;
                      });
                    }
                  }
                },
                style: AppTextStyle.regularBase,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
