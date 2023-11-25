import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflixclonetask/common/dimensions/app_dimensions.dart';
import 'package:netflixclonetask/features/stage/screens/stage_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppDimensions.screenSize,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Netflix Clone',
          theme: ThemeData(
            fontFamily: "NetflixSans",
            useMaterial3: true,
          ),
          home: const StageScreen(),
        );
      },
    );
  }
}
