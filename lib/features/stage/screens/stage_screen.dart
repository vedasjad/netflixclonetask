import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflixclonetask/common/colors/colors.dart';
import 'package:netflixclonetask/features/search/screen/search_screen.dart';

import '../../home/screens/home_screen.dart';
import '../controllers/stage_controller.dart';

class StageScreen extends ConsumerWidget {
  const StageScreen({super.key});
  static const screens = [
    HomeScreen(),
    SearchScreen(),
  ];

  updateSelectedScreenIndex(int index, WidgetRef ref) {
    ref.read(stageScreenControllerProvider).updateSelectedScreenIndex(index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedScreenIndex = ref.watch(stageProvider);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: StageScreen.screens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreenIndex,
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.greyLight2,
        unselectedItemColor: AppColors.grey,
        elevation: 5,
        onTap: (index) => updateSelectedScreenIndex(index, ref),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/name=home.svg",
              colorFilter: ColorFilter.mode(
                  selectedScreenIndex == 0
                      ? AppColors.greyLight2
                      : AppColors.grey,
                  BlendMode.srcIn),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/name=search.svg",
              colorFilter: ColorFilter.mode(
                  selectedScreenIndex == 1
                      ? AppColors.greyLight2
                      : AppColors.grey,
                  BlendMode.srcIn),
            ),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
