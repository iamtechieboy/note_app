import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/config/constants/assets.dart';

import '../../../../core/routes/routes.dart';
import '../../../interesting_idea/presentation/bloc/add_interesting_idea_cubit.dart';
import '../../../widgets/home_bottom_nav_bar.dart';
import '../../../widgets/interesting_idea_note_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AddInterestingIdeaCubit, AddInterestingIdeaState>(
          builder: (context, state) {
            return Stack(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(Assets.images.illustrationStart),
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              "Start Your Journey",
                              style: AppTextStyle.boldXl,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Every big step start with small step. \nNotes your first idea and start \n your journey!",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.regularSm.copyWith(color: AppColors.neutralColor.darkGrey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 30),
                        child: SvgPicture.asset(
                          Assets.images.arrowIndicator,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: state.interestingIdeaList.isNotEmpty,
                  child: Container(
                    color: AppColors.primaryColor.background,
                    height: double.maxFinite,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Visibility(
                          visible: state.interestingIdeaList.where((element) => (element.isPinned ?? false)).isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Pinned Notes",
                                      style: AppTextStyle.boldSm,
                                    ),
                                    Text("View all",
                                        style: AppTextStyle.medium2Xs.copyWith(
                                            decoration: TextDecoration.underline, color: AppColors.primaryColor.base)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 225,
                                child: ListView.custom(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  // itemCount: state.interestingIdeaList.length,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  childrenDelegate: SliverChildBuilderDelegate((context, index) {
                                    return InterestingIdeaNoteItem(
                                        item: state.interestingIdeaList[index],
                                        onTap: () {
                                          Navigator.pushNamed(context, Routes.interestingIdeaPage,
                                              arguments: {'model': state.interestingIdeaList[index], 'index': index});
                                        });
                                  }, childCount: state.interestingIdeaList.where((e) => e.isPinned ?? false).length),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: state.interestingIdeaList
                              .where((element) => !(element.isPinned ?? false || element.isFinished!))
                              .isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Interesting Idea",
                                      style: AppTextStyle.boldSm,
                                    ),
                                    Text("View all",
                                        style: AppTextStyle.medium2Xs.copyWith(
                                            decoration: TextDecoration.underline, color: AppColors.primaryColor.base)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 225,
                                child: ListView.custom(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  // itemCount: state.interestingIdeaList.length,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  childrenDelegate: SliverChildBuilderDelegate((context, index) {
                                    return InterestingIdeaNoteItem(
                                        item: state.interestingIdeaList[index],
                                        onTap: () {
                                          Navigator.pushNamed(context, Routes.interestingIdeaPage,
                                              arguments: {'model': state.interestingIdeaList[index], 'index': index});
                                        });
                                  }, childCount: state.interestingIdeaList.where((e) => !(e.isPinned ?? false)).length),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor.base,
          shape: const CircleBorder(),
          fixedSize: const Size.fromHeight(80),
        ),
        onPressed: () async {
          Navigator.pushNamed(context, Routes.newIdeaPage);
        },
        child: SvgPicture.asset(
          Assets.icons.plus,
          height: 32,
          color: AppColors.neutralColor.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
