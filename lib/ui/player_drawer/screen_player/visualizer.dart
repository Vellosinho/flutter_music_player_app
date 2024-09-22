
import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Visualizer extends StatelessWidget {
  const Visualizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => Stack(
        children: [
          PlayinVisualIndicator(rotation: 00, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[0], color: ColorPalette.visualizerDarkColor,),
          PlayinVisualIndicator(rotation: 300, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[1], color: ColorPalette.visualizerDarkColor,),
          PlayinVisualIndicator(rotation: 150, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[2], color: ColorPalette.visualizerDarkColor,),
          PlayinVisualIndicator(rotation: 450, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[3], color: ColorPalette.visualizerDarkColor,),
          PlayinVisualIndicator(rotation: 100, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[4], color: ColorPalette.visualizerMediumColor,),
          PlayinVisualIndicator(rotation: 400, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[5], color: ColorPalette.visualizerMediumColor,),
          PlayinVisualIndicator(rotation: 250, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[6], color: ColorPalette.visualizerMediumColor,),
          PlayinVisualIndicator(rotation: 550, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[7], color: ColorPalette.visualizerMediumColor,),
          PlayinVisualIndicator(rotation: 200, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[8], color: ColorPalette.visualizerLightColor,),
          PlayinVisualIndicator(rotation: 500, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[9], color: ColorPalette.visualizerLightColor,),
          PlayinVisualIndicator(rotation: 350, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[10], color: ColorPalette.visualizerLightColor,),
          PlayinVisualIndicator(rotation: 650, milliseconds: controller.visualizerBPM, radiusValues: controller.visualizerValues[11], color: ColorPalette.visualizerLightColor,),
        ]
      ),
    );
  }
}

class PlayinVisualIndicator extends StatelessWidget {
  final double rotation;
  final List<int> radiusValues;
  final Color color;
  final int milliseconds;
  const PlayinVisualIndicator({this.rotation = 0.0, required this.milliseconds, required this.radiusValues, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      // angle: radiusValues[0] * 4,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              (context.read<MusicPlayerProvider>().visualizerValues.isEmpty || context.read<MusicPlayerProvider>().songIsPlaying) ?
                radiusValues[0].toDouble() 
                : 150,
            ),
            // topLeft: Radius.circular(radius1),
            topRight: const Radius.circular(180),
            bottomLeft: const Radius.circular(180),
            bottomRight: Radius.circular(context.read<MusicPlayerProvider>().songIsPlaying ? radiusValues[1].toDouble() : 150),
          )
        ),
        // duration: const Duration(milliseconds: 400),
        duration: Duration(milliseconds: milliseconds),
        // curve: Curves.elasticIn,
        curve: Curves.easeInOutBack,
        height: 256,
        width: 256,
      ),
    );
  }
}