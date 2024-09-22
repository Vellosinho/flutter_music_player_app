import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerHeader extends StatelessWidget {
  const PlayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () { 
                  MusicPlayerProvider musicController = context.read<MusicPlayerProvider>();   
                  if(musicController.playerIsShowing) {
                    musicController.closePlayer();
                    Future.delayed(const Duration(milliseconds: 175), () {
                      musicController.toggleNavigationBar();
                    });
                  }
                },
                child: const Icon(FontAwesomeIcons.angleDown, size: 24)),
              Text('Now Playing', style: GoogleFonts.robotoCondensed(fontSize: 20, color: ColorPalette.primaryButtonColor, fontWeight: FontWeight.w600),),
              const SizedBox(width: 24),
          ],),
        ),
      ),
    );
  }
}