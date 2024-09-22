import 'package:beatful/model/album_model.dart';

class SongModel {
  final String songFilePath;
  final String songTitle;
  final AlbumModel album;
  final int songBPM;

  const SongModel({
    required this.songFilePath,
    required this.songTitle,
    required this.album,
    required this.songBPM});
}