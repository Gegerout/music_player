import 'dart:io';

import 'package:music_player/home/data/data_sources/local_data.dart';
import 'package:music_player/home/data/data_sources/remote_data.dart';
import 'package:music_player/home/domain/repositories/repository_impl.dart';
import 'package:music_player/home/domain/usecases/song_usecase.dart';
import 'package:path_provider/path_provider.dart';

class DataRepository extends Repository {
  @override
  Future<SongUseCase?> getSongs() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/songsData.json");
    if(file.existsSync()) {
      final data = await LocalData().getSongs();
      final usecase = SongUseCase(data);
      return usecase;
    }
    else {
      final data = await RemoteData().getSongs();
      if(data != null) {
        final usecase = SongUseCase(data);
        return usecase;
      }
      return null;
    }
  }

  @override
  Future<bool> isShown() async {
    final data = await LocalData().isShown();
    return data;
  }

}