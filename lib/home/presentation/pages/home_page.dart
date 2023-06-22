import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/home/presentation/states/home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/home_gradient.png"),
          ref.watch(homeProvider).when(
                data: (value) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.06)),
                          child: Center(
                            child: TextFormField(
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 25, right: 20),
                                  child: Image.asset("assets/images/search_icon.png", width: 22, height: 22, fit: BoxFit.contain,),
                                ),
                                contentPadding: EdgeInsets.zero,
                                hintText: "search song",
                                hintStyle: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.4)),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stacktrace) {
                  return Center(
                    child: Text(error.toString()),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        ],
      ),
    );
  }
}
