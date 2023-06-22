import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/home/presentation/pages/home_page.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/bg_gradient.png"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/headphones.png",
              width: double.infinity,
              height: 357,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text("Getting Started",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      fontSize: 38,
                      color: Colors.white)),
            ),
            Text("Getting started Getting",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8))),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF886AE2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(180))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Let's go",
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white)),
                      const SizedBox(
                        width: 24,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
            const Spacer(),
            Text("DIEMU",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white)),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text("BEST MUSIC APP",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 6,
                      color: Colors.white.withOpacity(0.5))),
            ),
          ],
        )
      ],
    ));
  }
}
