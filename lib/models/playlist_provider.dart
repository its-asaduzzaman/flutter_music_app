import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    Song(
      songName: "Bematlab",
      artistName: "Asim Azhar",
      albumArtImagePath: "assets/images/album_artwork_1.png",
      audioPath: "assets/audio/Bematlab.mp3",
    ),
    Song(
      songName: "Jaada",
      artistName: "Sreenath Bhasi",
      albumArtImagePath: "assets/images/album_artwork_2.png",
      audioPath: "assets/audio/Jaada.mp3",
    ),
    Song(
      songName: "Kuthanthram",
      artistName: "Vedanr",
      albumArtImagePath: "assets/images/album_artwork_3.png",
      audioPath: "assets/audio/Kuthanthram.mp3",
    ),
  ];

  //current song playlist index
  int? _currentSongIndex;

  //getter
  List<Song> get playList => _playlist;

  int? get currentSongIndex => _currentSongIndex;

  //setter
  set currentSongIndex(int? newIndex) {

    //update current song index
    _currentSongIndex = newIndex;
    //update ui
    notifyListeners();
  }
}
