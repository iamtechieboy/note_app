import 'package:flutter/material.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/domain/entities/enums.dart';
import 'package:note_app/presentation/components/enter_password.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 101,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Let's Login",
                    style: AppTextStyle.bold2Xl,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "And notes your idea",
                    style: AppTextStyle.regularBase.copyWith(
                      color: AppColors.neutralColor.darkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  loginFunc(
                    fullName: "Email Address",
                    hintText: "Example: johndoe@gmail.com",
                    keyboardInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(widthPasswordContainer: double.infinity),
                  Text(
                    "Forgot Password",
                    style: AppTextStyle.mediumBase.copyWith(
                      color: AppColors.primaryColor.base,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  IconicOvalButton(
                    text: "Login",
                    onTap: () {},
                    icon: Assets.icons.arrowRight,
                    isWidthMax: true,
                    height: 54,
                    cornerRadius: 27,
                    iconPosition: IconPosition.right,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            thickness: 3,
                            color: AppColors.neutralColor.lightGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Or",
                            style: AppTextStyle.medium2Xs.copyWith(
                              color: AppColors.neutralColor.darkGrey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 3,
                            color: AppColors.neutralColor.lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.neutralColor.baseGrey,
                      ),
                      borderRadius: BorderRadius.circular(27),                      
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.images.logoImage),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Login with Google",
                            style: AppTextStyle.mediumBase,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 54,
                      alignment: Alignment.center,
                      child: Text(
                        "Don’t have any account? Register here",
                        style: AppTextStyle.mediumBase.copyWith(
                          color: AppColors.primaryColor.base,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginFunc({
    required String fullName,
    required String hintText,
    required TextInputType keyboardInputType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullName,
          style: AppTextStyle.mediumBase,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            height: 54,
            child: Expanded(
              child: TextField(
                // bu yerga controller joylanadi
                minLines: 1,
                maxLines: 1,
                style: AppTextStyle.regularBase,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: hintText,
                  hintStyle: AppTextStyle.regularBase.copyWith(color: AppColors.neutralColor.baseGrey),
                  fillColor: AppColors.neutralColor.baseGrey,
                ),
                keyboardType: keyboardInputType,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
