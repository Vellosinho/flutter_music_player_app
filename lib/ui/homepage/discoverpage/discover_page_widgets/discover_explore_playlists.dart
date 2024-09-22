
import 'package:beatful/consts.dart';
import 'package:beatful/ui/homepage/discoverpage/discover_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePlaylists extends StatelessWidget {
  const ExplorePlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleWidget(
      title: 'Explore',
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: 254,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 32),
              PlaylistCovers(
                isMainBanner: true,
                imagePathes: [
                  'assets/album_covers/taylor_swift_lover.png',
                  'assets/album_covers/pink_floyd_dark_side.png',
                  'assets/album_covers/taylor_swift_folklore.png',
                  'assets/album_covers/the_beatles_abbey_road.png',
                  'assets/album_covers/taylor_swift_red.png',
                  'assets/album_covers/queen_II.png',
                ],
                playlistDescription:
                    'Listen to the most popular songs this week',
                playtlistLabel: 'Best of the Week',
              ),
              SizedBox(width: 16),
              PlaylistCovers(
                imagePathes: [
                  'assets/album_covers/taylor_swift_midnights.png',
                  'assets/album_covers/taylor_swift_1989.png',
                  'assets/album_covers/taylor_swift_folklore.png',
                  'assets/album_covers/taylor_swift_all_too_well.png',
                  'assets/album_covers/taylor_swift_lover.png',
                  'assets/album_covers/taylor_swift_red.png',
                ],
                playlistDescription:
                    'The best Taylor Swift songs',
                playtlistLabel: 'Best of Taylor Swift',
              ),
              SizedBox(width: 16),
              PlaylistCovers(
                imagePathes: [
                  'assets/album_covers/taylor_swift_lover.png',
                  'assets/album_covers/pink_floyd_dark_side.png',
                  'assets/album_covers/taylor_swift_folklore.png',
                  'assets/album_covers/the_beatles_abbey_road.png',
                  'assets/album_covers/queen_II.png',
                  'assets/album_covers/taylor_swift_red.png',
                ],
                playlistDescription:
                    'The best of pop',
                playtlistLabel: 'Best pop music',
              ),
              SizedBox(width: 16),
              PlaylistCovers(
                imagePathes: [
                  'assets/album_covers/taylor_swift_lover.png',
                  'assets/album_covers/pink_floyd_dark_side.png',
                  'assets/album_covers/taylor_swift_folklore.png',
                  'assets/album_covers/the_beatles_abbey_road.png',
                  'assets/album_covers/queen_II.png',
                  'assets/album_covers/taylor_swift_red.png',
                ],
                playlistDescription:
                    'Most liked songs this week',
                playtlistLabel: 'Best of the Week',
              ),
              SizedBox(width: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistCovers extends StatelessWidget {
  final List<String> imagePathes;
  final String playlistDescription;
  final String playtlistLabel;
  final bool? isMainBanner;

  const PlaylistCovers({
    required this.imagePathes,
    required this.playlistDescription,
    required this.playtlistLabel,
    this.isMainBanner,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return OverlayGradientWidget(
      gradientColor: ColorPalette.primaryButtonColor,
      gradientTopValue: 0.25,
      gradientBottomValue: 0.75,
      height: 212,
      width: (isMainBanner ?? false) ? 315 : 140,
      description: playlistDescription,
      topWidget: SizedBox(
        width: (isMainBanner ?? false) ? 289 : 116,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(playtlistLabel,
            style: GoogleFonts.robotoCondensed(
              height: 1.1,
              fontSize: (isMainBanner ?? false) ? 26 : 20,
              fontWeight: FontWeight.bold,
              color: ColorPalette.primaryBackgroundColor,
            ),
          ),
        ),
      ),
      child: SizedBox(
        height: 210,
        width: (isMainBanner ?? false) ? 315 : 140,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (isMainBanner ?? false) ? 3 : 2,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => Image.asset(imagePathes[index])),
      ),
    );
  }
}