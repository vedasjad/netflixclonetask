import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflixclonetask/common/colors/colors.dart';
import 'package:netflixclonetask/features/search/screen/search_screen.dart';

import '../../home/screens/home_screen.dart';

class StageScreen extends StatelessWidget {
  const StageScreen({super.key});
  static const screens = [
    HomeScreen(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    int selectedScreenIndex = 0;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: StageScreen.screens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.greyLight2,
        unselectedItemColor: AppColors.grey,
        elevation: 5,
        onTap: (index) {
          selectedScreenIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/name=home.svg",
              colorFilter:
                  const ColorFilter.mode(AppColors.greyLight2, BlendMode.srcIn),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/name=search.svg",
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
