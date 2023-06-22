import '../usecases/song_usecase.dart';

abstract class Repository {
  Future<SongUseCase?> getSongs();
  Future<bool> isShown();
}