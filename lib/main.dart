import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/home/presentation/pages/home_page.dart';
import 'package:music_player/home/presentation/pages/welcome_page.dart';
import 'package:music_player/home/presentation/states/home_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0817)
        ),
        scaffoldBackgroundColor: const Color(0xFF0F0817),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ref.watch(mainProvider).when(
              data: (value) {
                if(value) {
                  return const HomePage();
                }
                else {
                  return const WelcomePage();
                }
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
              )),
    );
  }
}