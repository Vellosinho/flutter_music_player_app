
import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? isPlayerButton;
  const AnimatedButton({super.key, this.height, this.width, this.isPlayerButton});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, state, _) {
        return GestureDetector(
          onTap: () {
            if (isPlayerButton ?? false) {
              state.playerIsShowing ? 
                state.toggleSongPlaying():
                null;
            } else {
              !state.playerIsShowing ? 
                state.toggleSongPlaying():
                null;
            }
          },
          child: SizedBox(
            height: height ?? 56,
            width: width ?? 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: (isPlayerButton ?? false) ? ColorPalette.secondaryButtonColor : ColorPalette.primaryBackgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular((height ?? 64) / 2),
                  )),
              child: Center(
                child: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: state.animationController,
                  color: (isPlayerButton ?? false) ? ColorPalette.primaryBackgroundColor : ColorPalette.secondaryButtonColor,
                  size: (height ?? 64) - 24,
                ),
              ))),
        );
      },
    );
  }
}