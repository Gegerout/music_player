import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/home/presentation/pages/player_page.dart';
import 'package:music_player/home/presentation/states/home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List images = [
    "assets/images/img_1.png",
    "assets/images/img_2.png",
  ];

  List lists = [
    ["assets/images/list_1.png", "Demien Rice", false],
    ["assets/images/list_2.png", "Billie Eilish", false],
    ["assets/images/list_3.png", "yann tiarse", false],
    ["assets/images/list_4.png", "Halsey", false],
  ];

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
                    child: SingleChildScrollView(
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
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 20),
                                    child: Image.asset(
                                      "assets/images/search_icon.png",
                                      width: 22,
                                      height: 22,
                                      fit: BoxFit.contain,
                                    ),
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
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Text("RECENTLY PLAYED",
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white)),
                              const Spacer(),
                              Text("See All",
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.5))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                images[0],
                                width: 175,
                                height: 175,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                images[1],
                                width: 175,
                                height: 175,
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Antretor",
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white)),
                                  Text("yann tiarsen",
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color:
                                              Colors.white.withOpacity(0.4))),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Back To Her Men",
                                        style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.white)),
                                    Text("Demien Rice",
                                        style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color:
                                                Colors.white.withOpacity(0.4))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Text("RECOMMENDATION",
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white)),
                              const Spacer(),
                              Text("See All",
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.5))),
                            ],
                          ),
                          SizedBox(
                            height: 500,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: lists.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlayerPage(
                                                    file: value[index].link,
                                                    title: value[index].title,
                                                    image: lists[index][0],
                                                writer: lists[index][1],
                                                isLiked: lists[index][2],
                                                duration: value[index].duration,
                                                  )));
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          lists[index][0],
                                          width: 80,
                                          height: 80,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 180,
                                              child: Text(
                                                value[index].title,
                                                style: GoogleFonts.urbanist(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              lists[index][1],
                                              style: GoogleFonts.urbanist(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.white
                                                      .withOpacity(0.4)),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                lists[index][2] =
                                                    !lists[index][2];
                                              });
                                            },
                                            icon: lists[index][2]
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                  ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
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
