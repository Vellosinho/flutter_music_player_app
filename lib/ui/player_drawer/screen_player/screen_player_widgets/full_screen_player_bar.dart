import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/player_drawer/animated_drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 12),
        PlayerIcons(
          onTap: () {},
          FontAwesomeIcons.shuffle,
        ),
        const SizedBox(width: 12),
        PlayerIcons(
          onTap: () {
            context.read<MusicPlayerProvider>().jumpBackSong();
          },
          FontAwesomeIcons.backwardStep,
        ),
        const AnimatedButton(isPlayerButton: true, height: 80, width: 80),
        PlayerIcons(
          onTap: () {
            context.read<MusicPlayerProvider>().jumpSong();
          },
          FontAwesomeIcons.forwardStep,
        ),
        const SizedBox(width: 12),
        PlayerIcons(
          onTap: () {},
          FontAwesomeIcons.retweet,
        ),
        const SizedBox(width: 12),
    ]);
  }
}


class PlayerIcons extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const PlayerIcons(this.icon,{super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(),
      child: Icon(icon, size: 32, color: ColorPalette.secondaryButtonColor),
    );
  }
}