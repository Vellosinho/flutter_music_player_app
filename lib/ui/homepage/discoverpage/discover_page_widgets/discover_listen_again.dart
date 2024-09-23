
import 'package:beatful/controller/music_player_controller.dart';
import 'package:beatful/playlist/songs.dart';
import 'package:beatful/ui/homepage/discoverpage/discover_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenAgain extends StatelessWidget {
  const ListenAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => TitleWidget(
        title: 'Listen again',
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            height: 208,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(children: [
                  SizedBox(width: (index == 0) ? 32 : 16),
                  ArtistImages(
                    imagePath: songs[index].album.albumCover,
                    onTap: () {
                      controller.chooseSong(songs, index);
                    },
                    playlistDescription: '${songs[index].songTitle} - ${songs[index].album.albumArtist}',
                  )
                ],);
              },
                // const SizedBox(width: 32),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/stephen_sanchez_UIFY.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/taylor_swift_all_too_well.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/taylor_swift_red.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/shawn_mendes_shawn_mendes.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/taylor_swift_midnights.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/shawn_mendes_shawn_mendes.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/the_beatles_abbey_road.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 16),
                // ArtistImages(
                //   onTap: () {},
                //   imagePath: 'assets/album_covers/taylor_swift_red.png',
                //   playlistDescription:
                //       '',
                // ),
                // const SizedBox(width: 32),
      
            ),
          ),
        ),
      ),
    );
  }
}