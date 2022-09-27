import 'package:flutter/material.dart';

import '../../config/constants/assets.dart';
import '../components/navigation_button.dart';
import '../routes/routes.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BottomNavButton(
                    isTabSelected: _currentTab == 0,
                    defIcon: Assets.icons.homeMenu,
                    filledIcon: Assets.icons.homeMenuFilled,
                    label: "Home",
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    callBack: () {
                      setState(() {
                        _currentTab = 0;
                      });
                    }),
                BottomNavButton(
                    isTabSelected: _currentTab == 1,
                    defIcon: Assets.icons.finishedMenu,
                    filledIcon: Assets.icons.finishedMenuFilled,
                    label: "Finished",
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    callBack: () {
                      setState(() {
                        _currentTab = 1;
                      });

                    }),
              ],
            ),
            Row(
              children: [
                BottomNavButton(
                    isTabSelected: _currentTab == 2,
                    defIcon: Assets.icons.searchMenu,
                    label: "Search",
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    callBack: () {
                      setState(() {
                        _currentTab = 2;
                      });
                    }),
                BottomNavButton(
                    isTabSelected: _currentTab == 3,
                    defIcon: Assets.icons.settingMenu,
                    label: "Setting",
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    callBack: () {
                      setState(() {
                        _currentTab = 3;
                      });
                      Navigator.pushNamed(context, Routes.settingsPage);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
