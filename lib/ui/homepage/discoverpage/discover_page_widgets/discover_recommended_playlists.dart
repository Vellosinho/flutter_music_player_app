
import 'package:beatful/ui/homepage/discoverpage/discover_page_widgets.dart';
import 'package:flutter/material.dart';

class DailySongs extends StatelessWidget {
  const DailySongs({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleWidget(
      title: 'Recommended for the day',
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: 182,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 32),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_midnights.png',
                playlistDescription:
                    'Taylor Swift, Ariana Grande, Drake, The...',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/shawn_mendes_shawn_mendes.png',
                playlistDescription:
                    'Shawn Mendes, Taylor Swift, Drake, The...',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/the_beatles_abbey_road.png',
                playlistDescription:
                    'The Beatles, Taylor Swift, Drake, Lil N..',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_red.png',
                playlistDescription:
                    'Taylor Swift, Ariana Grande, Drake, Lil N..',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_midnights.png',
                playlistDescription:
                    'Taylor Swift, Ariana Grande, Drake, Lil N...',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/shawn_mendes_shawn_mendes.png',
                playlistDescription:
                    'Shawn Mendes, Taylor Swift, The Weeknd...',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/the_beatles_abbey_road.png',
                playlistDescription:
                    'The Beatles, Taylor Swift, Drake, Lil N..',
              ),
              SizedBox(width: 16),
              ArtistImages(
                imagePath: 'assets/album_covers/taylor_swift_red.png',
                playlistDescription:
                    'Taylor Swift, Drake, The Weeknd, Lil N..',
              ),
              SizedBox(width: 32),
            ],
          ),
        ),
      ),
    );
  }
}