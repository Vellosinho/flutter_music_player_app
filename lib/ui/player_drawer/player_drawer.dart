import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/player_drawer/mini_player/mini_player.dart';
import 'package:beatful/ui/player_drawer/screen_player/full_screen_player.dart';
import 'package:beatful/ui/player_drawer/screen_player/screen_player_widgets/full_screen_player_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DrawerPlayer extends StatelessWidget {

  const DrawerPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, child) {
        return Stack(
          children: [
            AnimatedContainer(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0.0, -40.0),
                        blurRadius: 32,
                        color: ColorPalette.primaryButtonColor
                            .withOpacity(0.75)),
                  ],
                  color: ColorPalette.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                height: controller.playerIsShowing
                    ? MediaQuery.of(context).size.height
                    : 160,
                width: MediaQuery.of(context).size.width,
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeIn,
                child: Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: controller.navigationBarIsShowing ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 160),
                      child: const MiniPlayer(),
                    ),
                    AnimatedOpacity(opacity: controller.navigationBarIsShowing ? 0.0 : 1.0, duration: const Duration(milliseconds: 40), child: const PlayerHeader(),)
                  ],
                )),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                decoration: const BoxDecoration(
                  color: ColorPalette.primaryBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ), 
                ),
                height: controller.playerIsShowing
                    ? 6.85 * (MediaQuery.of(context).size.height / 8)
                    : 64,
                width: MediaQuery.of(context).size.width,
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeIn,
                child: Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: !controller.navigationBarIsShowing ? 0.0 : 1.0,
                      duration: const Duration(microseconds: 160),
                      curve: Curves.easeIn,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(FontAwesomeIcons.house),
                                Icon(FontAwesomeIcons.magnifyingGlass),
                                Icon(FontAwesomeIcons.bookOpen),
                                Icon(FontAwesomeIcons.heart),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: controller.navigationBarIsShowing ? 0.0 : 1.0,
                      duration: Duration(milliseconds: controller.navigationBarIsShowing ? 10 : 260),
                      child: const FullPlayer(),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
