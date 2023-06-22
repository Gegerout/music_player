import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage(
      {Key? key,
      required this.file,
      required this.title,
      required this.image,
      required this.writer, required this.isLiked, required this.duration})
      : super(key: key);

  final String file;
  final String title;
  final String image;
  final String writer;
  final bool isLiked;
  final double duration;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final player = AudioPlayer();
  late final duration;

  late Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == duration) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    duration = player.setFilePath(widget.file);
    startTimer();
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(widget.title,
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
      body: Column(
        children: [
          Center(
              child: Image.asset(
            widget.image,
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          )),
          const SizedBox(height: 40),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 280,
                      child: Text(
                        widget.title,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.writer,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.4)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(widget.isLiked ? Icons.favorite : Icons.favorite_border, color: Colors.white,),
              )
            ],
          ),
          LinearProgressIndicator(
            value: _start / widget.duration,
          )
        ],
      ),
    );
  }
}
