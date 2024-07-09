import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    Song(
      songName: "Bematlab",
      artistName: "Asim Azhar",
      albumArtImagePath: "assets/images/album_artwork_1.png",
      audioPath: "audio/Bematlab.mp3",
    ),
    Song(
      songName: "Jaada",
      artistName: "Sreenath Bhasi",
      albumArtImagePath: "assets/images/album_artwork_2.png",
      audioPath: "audio/Jaada.mp3",
    ),
    Song(
      songName: "Kuthanthram",
      artistName: "Vedanr",
      albumArtImagePath: "assets/images/album_artwork_3.png",
      audioPath: "audio/Kuthanthram.mp3",
    ),
  ];

  //current song playlist index
  int? _currentSongIndex;

///////////
  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause and resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      // go to the next song if it is not the last song
      currentSongIndex = _currentSongIndex! + 1;
    } else {
      //if it is the last song, loop back to the first song
      currentSongIndex = 0;
    }
  }

  //play previous song
  void playPreviousSong() async {
    //if more then 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
    }
    //if it is within 2 seconds of the song , go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if it the last song then loop back to the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to the duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song complete
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose the audio player

//////////

  //getter
  List<Song> get playList => _playlist;

  int? get currentSongIndex => _currentSongIndex;

  bool get isPlaying => _isPlaying;

  Duration get currentDuration => _currentDuration;

  Duration get totalDuration => _totalDuration;

  //setter
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); //play the song at the new index
    }
    //update ui
    notifyListeners();
  }
}
