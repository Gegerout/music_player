import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../models/song_model.dart';

class RemoteData {
  Future<List<SongModel>?> getSongs() async {
    List ids = [
      "WydRjcfQUhM",
      "kATLe0KIrZY",
      "1CurN2Fg-2E",
      "_Ci0Kgdpgsw",
      "T8BI2fKzdys",
      "pFS4zYWxzNA",
      "7Pv0u7uMn-g",
      "EDsD7tAsHM0",
      "3wS_2EpwNtQ",
      "MQquH1Y4U7Q"
    ];
    const String apiUrl = "https://youtube-mp36.p.rapidapi.com/dl";
    final Dio dio = Dio();
    dio.options.headers["X-RapidAPI-Key"] = "0738318e2cmsh47eedd76f3f7010p1480c6jsn3de90de9d58b";
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
      return songs;
    }
    return null;
  }
}