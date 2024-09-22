import 'dart:math';

import 'package:beatful/model/song_model.dart';
import 'package:beatful/playlist/songs.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerProvider extends ChangeNotifier {
  //Visualizer values list:
  final List<List<int>> _visualizerValues = [];
  List<List<int>> get visualizerValues => _visualizerValues;

  List<SongModel> currentPlaylist = songs;
  int currentSongIndex = 0; 

  //Player related values:
  bool _playerIsShowing =  false;
  bool _navigationBarIsShowing = true;
  bool _songIsPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  late final AnimationController _animationController;
  late double _duration;
  late double _position;
  late int _visualizerBPM;
  late SongModel _currentSong;

  bool get playerIsShowing => _playerIsShowing;
  bool get navigationBarIsShowing => _navigationBarIsShowing;
  bool get songIsPlaying => _songIsPlaying;
  AudioPlayer get audioPlayer => _audioPlayer;
  AnimationController get animationController => _animationController;
  double get duration => _duration;
  double get position => _position;
  int get visualizerBPM => _visualizerBPM;
  SongModel get currentSong => _currentSong;

  void openPlayer() {
    _playerIsShowing = true;
    notifyListeners();
  }

  void closePlayer() {
    _playerIsShowing = false;
    notifyListeners();
  }

  void toggleNavigationBar() {
    _navigationBarIsShowing = !_navigationBarIsShowing;
    notifyListeners();
  }

  void toggleSongPlaying() {
    (_songIsPlaying) ? _audioPlayer.pause() : _audioPlayer.resume();
    _songIsPlaying = !_songIsPlaying;
    
    !songIsPlaying ?
      _animationController.reverse()
    :
      _animationController.forward();
    
    notifyListeners();
  }

  Future<void> changeSongPosition(Duration value) async {
    await _audioPlayer.seek(value);
    notifyListeners();
  }

  void initPlayer(AnimationController newController, SongModel song) {
    _animationController = newController;
    setSong(song);
    getVisualizerTime();
    updatePosition();
  }

  void setSong(SongModel song) async {
    // await _audioPlayer.play(AssetSource('songs_folder/taylor_swift_lavender_haze.mp3'));
    _currentSong = song;
    await _audioPlayer.play(AssetSource(currentSong.songFilePath));
    _audioPlayer.pause();

    getSongDuration();
    getVisualizerTime();
    disposeVisualizer();
    initializeVisualizer();
    notifyListeners();
  }

  void updateSong(SongModel song) async {
    // await _audioPlayer.play(AssetSource('songs_folder/taylor_swift_lavender_haze.mp3'));
    _currentSong = song;

    await _audioPlayer.play(AssetSource(currentSong.songFilePath));
    
    if (_songIsPlaying) {
      _audioPlayer.resume();
    } else {
      _audioPlayer.pause();
    }
    getSongDuration();
    getVisualizerTime();
    notifyListeners();
  }

  void getSongDuration() async{
    Duration songDuration = await _audioPlayer.getDuration() ?? Duration.zero;
    _duration = songDuration.inSeconds.toDouble();
    Duration songPosition = await _audioPlayer.getCurrentPosition() ?? Duration.zero;
    _position = songPosition.inSeconds.toDouble();


  }

  void updatePosition() async {
    Duration songPosition = await _audioPlayer.getCurrentPosition() ?? Duration.zero;
    _position = songPosition.inSeconds.toDouble();
    notifyListeners();
    // if(_position == _duration) {
    //   jumpSong();
    // }

    Future.delayed(const Duration(milliseconds: 1000), () {
      checkPosition();
    });
  }
  
  void checkPosition() async {
    Duration songPosition = await _audioPlayer.getCurrentPosition() ?? Duration.zero;
    _position = songPosition.inSeconds.toDouble();
    notifyListeners();
    if(_position == _duration) {
      jumpSong();
    }

    Future.delayed(const Duration(milliseconds: 1000), () {
      checkPosition();
    });
  }

  void getVisualizerTime() {
    //get updates per second:
    double visualizerUpdatesPerSecond = ((1 / currentSong.songBPM) * 60);

    //get updates per millisecond:
    _visualizerBPM = (visualizerUpdatesPerSecond * 1000).toInt();
    notifyListeners();
  }

  // Visualizer related funcions:  
  void initializeVisualizer() {
    _visualizerValues.clear();
    for (int i = 0; i < 12; i++) {
      _visualizerValues.add([20, 20]);
    }

    visualizerLoop();
  }
  
  void visualizerLoop() async{
    if (_visualizerValues.isNotEmpty) {
      Random random = Random();
      for (int i = 0; i < 12 ; i++) {
        _visualizerValues[i][0] = (0 + random.nextInt(150));
        _visualizerValues[i][1] = (0 + random.nextInt(150));
      }

      // Future.delayed(const Duration(milliseconds:400), () {
      Future.delayed(Duration(milliseconds: _visualizerBPM), () {
        visualizerLoop();
      });
    } else {
      toggleSongPlaying();
    }
      notifyListeners();
  }

  void disposeVisualizer() {
    _visualizerValues.clear();
  }

  void jumpSong() {
    if(currentSongIndex >= songs.length - 1) {
      currentSongIndex = 0;
      updateSong(songs[currentSongIndex]);
    } else {
      updateSong(songs[++currentSongIndex]);
    }
    _audioPlayer.resume();
    notifyListeners();
  }

  void jumpBackSong() {
    if (currentSongIndex <= 0) {
      currentSongIndex = (songs.length - 1);
      updateSong(songs[currentSongIndex]);
    } else {
      updateSong(songs[--currentSongIndex]);
    }
    _audioPlayer.resume();
    notifyListeners();
  }
}