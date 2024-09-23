import 'package:beatful/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const TitleWidget({required this.child, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 24),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: ColorPalette.primaryButtonColor),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}

class OverlayGradientWidget extends StatelessWidget {
  final Widget child;
  final Widget? topWidget;
  final double height;
  final double width;
  final String description;
  final double? gradientTopValue;
  final double? gradientBottomValue;
  final Color? gradientColor;

  const OverlayGradientWidget({
    required this.child,
    this.topWidget,
    required this.height,
    required this.width,
    required this.description,
    this.gradientBottomValue,
    this.gradientTopValue,
    this.gradientColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Color selectedGradientColor = gradientColor ?? ColorPalette.vividPurpleColor;
    return Column(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: SizedBox(
              child: Stack(
                children: [
                  child,
                  SizedBox(
                    height: height,
                    width: width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        selectedGradientColor.withOpacity(gradientTopValue ?? 0),
                        selectedGradientColor.withOpacity(gradientBottomValue ?? 0.65)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )))),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: width,
                        height: height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(child: topWidget),
                              ],
                            ),
                          ],
                      ),
                    ),
                )
              ],
            )))),
        const SizedBox(height: 8),
        SizedBox(
          width: width,
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            description,
            style: GoogleFonts.robotoCondensed(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.1,
              color: ColorPalette.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

class ArtistImages extends StatelessWidget {
  final Function onTap;
  final String imagePath;
  final String playlistDescription;

  const ArtistImages(
      {required this.imagePath, required this.onTap, required this.playlistDescription, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: OverlayGradientWidget(
        description: playlistDescription,
        gradientColor: ColorPalette.primaryButtonColor,
        height: 140,
        width: 140,
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}