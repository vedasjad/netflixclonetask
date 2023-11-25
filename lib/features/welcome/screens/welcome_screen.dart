import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflixclonetask/common/navigators/navigators.dart';
import 'package:netflixclonetask/features/stage/screens/stage_screen.dart';

import '../../../common/colors/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          "assets/images/logos/netflix-logo.svg",
          height: 22.h,
          width: 86.w,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Privacy",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Sign In",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Unlimited movies, TV shows, and more.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Watch anywhere. Cancel anytime.\nTap the link below to sign up.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: ElevatedButton(
                onPressed: () =>
                    AppNavigators.animatedPushTo(context, const StageScreen()),
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(343.w, 44.h)),
                  shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.red),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
