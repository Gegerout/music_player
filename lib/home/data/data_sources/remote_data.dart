import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../models/song_model.dart';

class RemoteData {
  static var httpClient = HttpClient();

  Future<List<SongModel>?> getSongs() async {
    List ids = [
      "WydRjcfQUhM",
      "kATLe0KIrZY",
      "1CurN2Fg-2E",
      "_Ci0Kgdpgsw",
    ];
    const String apiUrl = "https://youtube-mp36.p.rapidapi.com/dl";
    final Dio dio = Dio();
    dio.options.headers["X-RapidAPI-Key"] = "67444d9cc6mshd2aba75bcc451a6p10b6e3jsnec1200b99aa8";
    dio.options.headers["X-RapidAPI-Host"] = "youtube-mp36.p.rapidapi.com";
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/songsData.json");
    List<SongModel> songs = [];
    for(int i = 0; i < ids.length; i++) {
      final data = await dio.get(apiUrl, queryParameters: {
        "id": ids[i]
      });
      if(data.statusCode == 200) {
        final model = SongModel.fromJson(data.data);
        songs.add(model);
      }
      else {
        continue;
      }
    }
    if(songs.isNotEmpty) {
      for(int i = 0; i < ids.length; i++) {
        var request = await httpClient.getUrl(Uri.parse(songs[i].link));
        var response = await request.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        final song = File("${dir.path}/song$i");
        song.writeAsBytes(bytes);
        songs[i].link = "${dir.path}/song$i";
      }
      file.writeAsStringSync(json.encode(songs));
      return songs;
    }
    return null;
  }
}