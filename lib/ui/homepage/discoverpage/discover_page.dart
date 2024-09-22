import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/ui/homepage/discoverpage/discover_page_widgets/discover_listen_again.dart';
import 'package:beatful/ui/homepage/page_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'discover_page_widgets/discover_explore_playlists.dart';
import 'discover_page_widgets/discover_recommended_playlists.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //Background image: The first image rendered in the page
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
            //Exhibits other discovery page widgets in order
            ListView(
              children: const [
                PageHeader(header: 'Discover'),
                DailySongs(),
                ExplorePlaylists(),
                ListenAgain(),
                SizedBox(height: 144)
              ],
            )
          ],
        ),
      ),
    );
  }
}
