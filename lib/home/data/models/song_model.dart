import 'dart:typed_data';

class SongModel {
  final String title;
  String link;
  final double duration;

   factory SongModel.fromJson(Map<String, dynamic> json) {
       return SongModel(json["title"], json["link"], json["duration"]);
   }

  SongModel(this.title, this.link, this.duration);

   Map<String, dynamic> toJson() => {
     "title": title,
     "link": link,
     "duration": duration,
   };
}