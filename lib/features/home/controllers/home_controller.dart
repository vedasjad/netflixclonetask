import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflixclonetask/features/home/repositories/show_info_repository.dart';

final showInfosProvider = FutureProvider((ref) {
  final entryRepository = ref.watch(showInfoRepositoryProvider);
  return entryRepository.allShowInfos();
});

final homeScreenControllerProvider = Provider((ref) {
  final showInfoRepository = ref.watch(showInfoRepositoryProvider);
  return HomeScreenController(ref: ref, showInfoRepository: showInfoRepository);
});

class HomeScreenController {
  final ProviderRef ref;
  final ShowInfoRepository showInfoRepository;

  HomeScreenController({required this.ref, required this.showInfoRepository});

  Future allShowInfos() async {
    return await showInfoRepository.allShowInfos();
  }
}
