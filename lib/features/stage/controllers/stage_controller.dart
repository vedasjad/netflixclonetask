import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/stage_repository.dart';

final stageProvider = Provider<int>((ref) {
  final stageRepository = ref.watch(stageRepositoryProvider);
  return stageRepository.selectedScreenIndex;
});

final stageScreenControllerProvider = Provider((ref) {
  final stageRepository = ref.watch(stageRepositoryProvider);
  return StageScreenController(ref: ref, stageRepository: stageRepository);
});

class StageScreenController {
  final ProviderRef ref;
  final StageRepository stageRepository;
  StageScreenController({required this.ref, required this.stageRepository});

  void updateSelectedScreenIndex(int index) {
    stageRepository.updateSelectedScreenIndex(index);
    ref.refresh(stageProvider);
  }
}
