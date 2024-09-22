import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/player_drawer/animated_drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: DecoratedBox(
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(
                          offset: Offset(6, 0),
                          color: ColorPalette.primaryButtonColor,
                          blurRadius: 6,
                        )
                      ],
                      border: Border.all(width: 1, color: ColorPalette.primaryBackgroundColor),
                      borderRadius: BorderRadius.circular(36),),
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: Image.asset(
                              controller.currentSong.album.albumCover),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 144,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Text(context.read<MusicPlayerProvider>().currentSong.songTitle,
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPalette.primaryTextColor)),
                              onTap: () {
                                if (!controller.playerIsShowing) {
                                  context.read<MusicPlayerProvider>().openPlayer();
                                  context.read<MusicPlayerProvider>().toggleNavigationBar();
                                }
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            SizedBox(
                              width: 144,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                '${controller.currentSong.album.albumArtist} - ${controller.currentSong.album.albumTitle}',
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorPalette.primaryTextColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(),
                  const Icon(FontAwesomeIcons.heart),
                  const AnimatedButton(),
                ],
              )),
        ],
      ),
    );
  }
}
