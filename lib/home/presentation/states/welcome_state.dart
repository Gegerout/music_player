import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/data_repository.dart';

final welcomeProvider = FutureProvider((ref) async {
  final data = await DataRepository().getSongs();
  if(data != null) {
    return data;
  }
  else {
    throw Error();
  }
});
