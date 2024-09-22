import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/player_drawer/screen_player/visualizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FullScreenSongInfo extends StatelessWidget {
  const FullScreenSongInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder:(context, controller, _) => Column(children: [
          Column(
            children: [
              const SizedBox(height: 96),
              Center(
                child: SizedBox(
                  height: 256, width: 256,
                  child: Stack(
                    children: [
                      const Visualizer(),
                      Center(
                        child: SizedBox(
                          height: 256, width: 256,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(128)),
                            child: Image.asset(controller.currentSong.album.albumCover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Container(height: 4, width: 360, color: ColorPalette.visualizerDarkColor),
              Text(controller.currentSong.songTitle, style: GoogleFonts.bigShouldersText(fontSize: 48, color: ColorPalette.primaryButtonColor, fontWeight: FontWeight.bold),),
              Text('${controller.currentSong.album.albumArtist} - ${controller.currentSong.album.albumTitle}', style: GoogleFonts.robotoCondensed(fontSize: 20, color: ColorPalette.secondaryButtonColor, fontWeight: FontWeight.w500),),
              const SizedBox(height: 12),],)
          ]),
    );
  }
}