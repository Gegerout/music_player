import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = ChangeNotifierProvider((ref) => SearchNotifier());

class SearchNotifier extends ChangeNotifier {
  List<String> searched = [];

  void searchSong(String name, List<String> titles) {
    final result = titles.where((element) => element.toLowerCase().contains(name.toLowerCase())).toList();
    searched = result;
    notifyListeners();
  }
}