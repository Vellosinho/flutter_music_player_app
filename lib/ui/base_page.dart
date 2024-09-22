import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/playlist/songs.dart';
import 'package:beatful/ui/player_drawer/player_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage/discoverpage/discover_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    context.read<MusicPlayerProvider>().initPlayer(
      AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 240),
      ),
      // lavenderHaze,
      songs[0],
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, _, child) {
        return Scaffold(
            body: Stack(
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(child: const DiscoverPage()),
              ],
            ),
            const Positioned(bottom: 0, child: DrawerPlayer()),
          ],
        ));
      },
    );
  }
}
