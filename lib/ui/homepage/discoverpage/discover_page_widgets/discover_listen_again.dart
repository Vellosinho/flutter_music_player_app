
import 'package:beatful/ui/homepage/discoverpage/discover_page_widgets.dart';
import 'package:flutter/material.dart';

class ListenAgain extends StatelessWidget {
  const ListenAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleWidget(
      title: 'Listen again',
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: 208,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 32),
              ArtistImages(
                imagePath: 'assets/album_covers/stephen_sanchez_UIFY.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_all_too_well.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_red.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/shawn_mendes_shawn_mendes.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_midnights.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/shawn_mendes_shawn_mendes.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/the_beatles_abbey_road.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_red.png',
                playlistDescription:
                    '',
              ),
              SizedBox(width: 32),
            ],
          ),
        ),
      ),
    );
  }
}