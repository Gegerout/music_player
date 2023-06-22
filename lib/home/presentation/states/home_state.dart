import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/data_repository.dart';

final homeProvider = FutureProvider((ref) async {
  final data = await DataRepository().getSongs();
  if(data != null) {
    return data.data;
  }
  else {
    throw Error();
  }
});
