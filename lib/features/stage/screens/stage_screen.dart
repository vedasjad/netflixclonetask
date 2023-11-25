import 'package:flutter/material.dart';
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
    );
  }
}
