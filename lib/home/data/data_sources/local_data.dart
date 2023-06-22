import 'dart:convert';
import 'dart:io';
import 'package:music_player/home/data/models/song_model.dart';
import 'package:path_provider/path_provider.dart';

class LocalData {
  Future<List<SongModel>> getSongs() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/songsData.json");
    final songs = (json.decode(file.readAsStringSync()) as List).map((e) => SongModel.fromJson(e)).toList();
    return songs;
  }
  Future<bool> isShown() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/songsData.json");
    return file.existsSync();
  }
}