import 'package:music_player/home/data/data_sources/remote_data.dart';
import 'package:music_player/home/domain/repositories/repository_impl.dart';
import 'package:music_player/home/domain/usecases/song_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<SongUseCase?> getSongs() async {
    final data = await RemoteData().getSongs();
    if(data != null) {
      final usecase = SongUseCase(data);
      return usecase;
    }
    return null;
  }

}