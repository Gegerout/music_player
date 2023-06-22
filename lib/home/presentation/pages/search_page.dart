import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/home/presentation/pages/player_page.dart';

import '../../data/models/song_model.dart';
import '../states/search_state.dart';

class SearchPage extends ConsumerStatefulWidget {
  SearchPage({Key? key, required this.values}) : super(key: key);

  final List<SongModel> values;

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  List lists = [
    ["assets/images/list_1.png", "Demien Rice", false],
    ["assets/images/list_2.png", "Billie Eilish", false],
    ["assets/images/list_3.png", "yann tiarse", false],
    ["assets/images/list_4.png", "Halsey", false],
    ["assets/images/list_1.png", "Demien Rice", false],
    ["assets/images/list_2.png", "Billie Eilish", false],
    ["assets/images/list_3.png", "yann tiarse", false],
    ["assets/images/list_4.png", "Halsey", false],
  ];

  @override
  Widget build(BuildContext context) {
    final searched = ref.watch(searchProvider).searched;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text("Search Page",
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          Image.asset("assets/images/home_gradient.png"),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.06)),
                  child: Center(
                    child: TextFormField(
                      onChanged: (value) {
                        ref.read(searchProvider.notifier).searchSong(value, widget.values.map((e) => e.title).toList());
                      },
                      autofocus: true,
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
      const SizedBox(height: 20),
      Expanded(
        child: ListView.builder(
                      itemCount: searched.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlayerPage(
                                        file: widget.values[index].link,
                                        title: widget.values[index].title,
                                        image: lists[index][0],
                                        writer: lists[index][1],
                                        isLiked: lists[index][2],
                                        duration:
                                        widget.values[index].duration,
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
                                        widget.values[index].title,
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
      ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
