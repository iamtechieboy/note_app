import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/checkbox_buying_component.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

import '../../components/checkbox_component.dart';

class BuyingSomethingPage extends StatefulWidget {
  const BuyingSomethingPage({super.key});

  @override
  State<BuyingSomethingPage> createState() => _BuyingSomethingPageState();
}

class _BuyingSomethingPageState extends State<BuyingSomethingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width - 32,
                    child: Flexible(
                      child: TextFormField(
                        style: AppTextStyle.bold2Xl,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        decoration: InputDecoration(
                          prefixIcon: Transform.scale(
                            scale: 0.7,
                            child: SvgPicture.asset(
                              "assets/icons/shopping_cart.svg",
                              color: AppColors.primaryColor.dark,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Title Here",
                          hintStyle: AppTextStyle.bold2Xl.copyWith(
                            color: AppColors.neutralColor.baseGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const CHeckBoxesBuyingSomethingWidget(),
                ],
              ),
            ),
          ),
          BottomTaskBar(
            context: context,
          ),
        ],
      ),
    );
  }
}
