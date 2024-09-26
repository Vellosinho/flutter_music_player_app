import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_player_bar.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_player_slider.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_song_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FullPlayer extends StatelessWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            child: Opacity(
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
          ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  FullScreenSongInfo(),
                  PlayerSliderBar(),
                  SizedBox(height: 8),
                  PlayerBar()
                ],
              ),
            ),
            const Positioned(right: 40, top: 40, child: Icon(FontAwesomeIcons.heart))
          ],),
        
    );
  }
}
