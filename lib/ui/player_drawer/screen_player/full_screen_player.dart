import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_player_bar.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_player_slider.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_song_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullPlayer extends StatelessWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => Stack(
        children: [
          Opacity(
              opacity: 0.15,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        controller.currentSong.album.albumCover),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  FullScreenSongInfo(),
                  PlayerSliderBar(),
                  SizedBox(height: 24),
                  PlayerBar()
                ],
              ),
            ),
          ],),
        
    );
  }
}
