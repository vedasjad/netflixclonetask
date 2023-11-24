import 'package:flutter/material.dart';
import 'package:netflixclonetask/features/stage/screens/stage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData(
        fontFamily: "NetflixSans",
        useMaterial3: true,
      ),
      home: const StageScreen(),
    );
  }
}
