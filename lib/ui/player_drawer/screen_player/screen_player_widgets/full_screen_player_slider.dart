import 'package:beatful/consts.dart';
import 'package:beatful/controller/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerSliderBar extends StatelessWidget {
  const PlayerSliderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerProvider>(
      builder: (context, controller, _) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(formatTime(controller.position)),
              Text(formatTime(controller.duration)),
            ],),
          ),
          Slider(
          activeColor: ColorPalette.primaryButtonColor,
          inactiveColor: ColorPalette.primaryColor,
          min: 0,
          max: controller.duration,
          value: controller.position,
          onChanged: (value) async {
            final position = Duration(milliseconds: value.toInt());
            controller.changeSongPosition(position);
          },
          ),
        ],
      ),
    );
  }

  
  String formatTime(double time) {
    int minutes = (time.toInt() ~/ 60000);
    int seconds = (time.toInt() % 60000) ~/ 1000;

    String minutesFormated;
    String secondsFormated;

    (minutes < 10) ?
      minutesFormated = '0${minutes.toString()}' : minutesFormated = minutes.toString();
    
    (seconds < 10) ?
      secondsFormated = '0${seconds.toString()}' : secondsFormated = seconds.toString();

    return '$minutesFormated:$secondsFormated';
  }
}