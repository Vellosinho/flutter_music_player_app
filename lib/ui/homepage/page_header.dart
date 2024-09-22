
import 'package:beatful/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeader extends StatelessWidget {
  final String header;
  const PageHeader({required this.header, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                header,
                style: GoogleFonts.bigShouldersText(
                    color: ColorPalette.primaryButtonColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 40),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              PageButtons(label: 'New', selected: true,),
              SizedBox(width: 8),
              PageButtons(label: 'Playlists', selected: false,),
              SizedBox(width: 8),
              PageButtons(label: 'Albuns', selected: false),
            ],
          )
        ],
      ),
    );
  }
}

class PageButtons extends StatelessWidget {
  final String label;
  final bool selected;
  const PageButtons({required this.label, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 72,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? ColorPalette.primaryButtonColor : ColorPalette.primaryBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorPalette.primaryButtonColor)
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.roboto(
              color: selected ? ColorPalette.primaryBackgroundColor : ColorPalette.primaryButtonColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
