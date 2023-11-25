import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflixclonetask/features/home/controllers/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: ref.watch(showInfosProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, trace) => Center(child: Text(error.toString())),
              data: (showInfos) {
                return Column(
                  children: [Text(showInfos.length.toString())],
                );
              },
            ),
      ),
    );
  }
}
