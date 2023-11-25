import 'package:flutter_riverpod/flutter_riverpod.dart';

final stageRepositoryProvider = Provider((ref) => StageRepository());

class StageRepository {
  int _selectedScreenIndex = 0;
  void updateSelectedScreenIndex(int index) {
    _selectedScreenIndex = index;
  }

  get selectedScreenIndex => _selectedScreenIndex;
}
