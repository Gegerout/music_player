import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/home/presentation/states/welcome_state.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(welcomeProvider).when(
        data: (value) {
          return Scaffold(
            body: Column(
              children: [
                Text(value.data[0].title),
              ],
            ),
          );
        },
        error: (error, stacktrace) {
          return Scaffold(
            body: Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () => const Scaffold(
          body: Center(
                child: CircularProgressIndicator(),
              ),
        ));
  }
}
