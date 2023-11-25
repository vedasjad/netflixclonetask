import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/show_info.dart';
import '../repositories/searched_show_repository.dart';

final searchedShowsProvider =
    FutureProvider.family<List<ShowInfo>, String>((ref, searchTerm) {
  final searchedShowRepository = ref.watch(searchedShowRepositoryProvider);
  return searchedShowRepository.allSearchedShows(searchTerm);
});
final searchScreenControllerProvider =
    FutureProvider.family<List<ShowInfo>, String>((ref, searchTerm) {
  final searchedShowRepository = ref.watch(searchedShowRepositoryProvider);
  return SearchScreenController(searchShowRepository: searchedShowRepository)
      .allSearchedShows(searchTerm);
});

class SearchScreenController {
  final SearchedShowRepository searchShowRepository;

  SearchScreenController({required this.searchShowRepository});

  Future<List<ShowInfo>> allSearchedShows(String searchTerm) async {
    return await searchShowRepository.allSearchedShows(searchTerm);
  }
}
