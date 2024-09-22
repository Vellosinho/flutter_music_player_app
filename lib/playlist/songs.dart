import 'package:beatful/model/song_model.dart';
import 'package:beatful/playlist/albuns.dart';

SongModel lavenderHaze = SongModel(
  songFilePath: 'songs_folder/taylor_swift_lavender_haze.mp3',
  songTitle: 'Lavender Haze',
  album: midnights,
  songBPM: 97,
);

SongModel twentyTwo = SongModel(
  songFilePath: 'songs_folder/taylor_swift_22.mp3',
  songTitle: '22',
  album: red,
  songBPM: 104,
);

SongModel allTooWell = SongModel(
  songFilePath: 'songs_folder/taylor_swift_all_too_well.mp3',
  songTitle: 'All Too Well',
  album: allTooWellAlbum,
  songBPM: 93,
);

SongModel beginAgain = SongModel(
  songFilePath: 'songs_folder/taylor_swift_begin_again.mp3',
  songTitle: 'Begin Again',
  album: allTooWellAlbum,
  songBPM: 79,
);

SongModel betty = SongModel(
  songFilePath: 'songs_folder/taylor_swift_betty.mp3',
  songTitle: 'Betty',
  album: folklore,
  songBPM: 96,
);

SongModel daylight = SongModel(
  songFilePath: 'songs_folder/taylor_swift_daylight.mp3',
  songTitle: 'Daylight',
  album: loverAlbum,
  songBPM: 75,
);

SongModel lover = SongModel(
  songFilePath: 'songs_folder/taylor_swift_lover.mp3',
  songTitle: 'Lover',
  album: loverAlbum,
  songBPM: 103,
);

SongModel thisLove = SongModel(
  songFilePath: 'songs_folder/taylor_swift_this_love.mp3',
  songTitle: 'This Love',
  album: taylorSwift1989,
  songBPM: 144,
);

SongModel sweetNothing = SongModel(
  songFilePath: 'songs_folder/taylor_swift_sweet_nothing.mp3',
  songTitle: 'Sweet Nothing',
  album: midnights,
  songBPM: 176,
);

SongModel timeless = SongModel(
  songFilePath: 'songs_folder/taylor_swift_timeless.mp3',
  songTitle: 'Timeless',
  album: folklore,
  songBPM: 143,
);

List<SongModel> songs = [
  lavenderHaze,
  twentyTwo,
  allTooWell,
  beginAgain,
  betty,
  daylight,
  lover,
  thisLove,
  sweetNothing,
  timeless
];