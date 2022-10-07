import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';
import 'package:note_app/core/domain/entities/enums.dart';
import 'package:note_app/presentation/components/iconic_oval_button.dart';
import 'package:note_app/presentation/components/onboarding_page_component.dart';
import 'package:note_app/presentation/pages/login/login_page.dart';
import 'package:note_app/presentation/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with SingleTickerProviderStateMixin {
  PageController _controller = PageController();
  bool visible = false;
  bool onLastPage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                if (index == 0) {
                  visible = false;
                }
                if (index >= 1) {
                  visible = true;
                }
              });
            },
            children: [
              OnBoardingPageComponent(
                text: "Jot Down anything you want to achieve, today or in the future",
                text2: Assets.images.illustrationImageOne,
              ),
              OnBoardingPageComponent(
                text: "Different goals, different way to jot it down.",
                text2: Assets.images.illustrationImageTwo,
              ),
              OnBoardingPageComponent(
                text: "Text area, checklist, or some combination. Adapt with your needs",
                text2: Assets.images.illustrationImageThree,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 102),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    effect: WormEffect(
                      activeDotColor: AppColors.secondaryColor.base,
                      dotColor: AppColors.primaryColor.light,
                    ),
                    count: 3,
                  ),
                ),
                onLastPage
                    ? IconicOvalButton(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        text: "Proceed to Login",
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage(),),);
                        },
                        isWidthMax: true,
                        icon: Assets.icons.arrowRight,
                        iconColor: AppColors.primaryColor.base,
                        iconPosition: IconPosition.right,
                        textColor: AppColors.primaryColor.base,
                        height: 54,
                        boxDecoration: BoxDecoration(
                          color: AppColors.neutralColor.white,
                          borderRadius: BorderRadius.circular(27),
                        ),
                      )
                    : IconicOvalButton(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        text: visible == true ? "Next" : "Let’s Get Started",
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(
                              milliseconds: 100,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        isWidthMax: true,
                        icon: Assets.icons.arrowRight,
                        iconColor: AppColors.primaryColor.base,
                        iconPosition: IconPosition.right,
                        textColor: AppColors.primaryColor.base,
                        height: 54,
                        boxDecoration: BoxDecoration(
                          color: AppColors.neutralColor.white,
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                Visibility(
                  visible: visible,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: InkWell(
                    onTap: () {
                      _controller.previousPage(duration: const Duration(microseconds: 100), curve: Curves.easeIn);
                    },
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "Previous",
                        style: AppTextStyle.mediumBase.copyWith(
                          color: AppColors.neutralColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
