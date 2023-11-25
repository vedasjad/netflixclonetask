import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../models/show_info.dart';

final showInfoRepositoryProvider = Provider((_) => ShowInfoRepository());

class ShowInfoRepository {
  final List<ShowInfo> _showInfos = [];
  Future<List<ShowInfo>> allShowInfos() async {
    const String url = 'https://api.tvmaze.com/search/shows?q=all';
    int statusCode = 400;
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      statusCode = res.statusCode;
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        _showInfos.add(ShowInfo.fromMap(jsonDecode(res.body)[i]));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return _showInfos;
  }
}
