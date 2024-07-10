import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/quran/widgets/surahayatwidget.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls(
      {super.key, required this.audioPlayer, required this.positionDataStream});
  final AudioPlayer audioPlayer;
  final Stream<PositionData> positionDataStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final PlayerState? playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: audioPlayer.play,
            icon: const Icon(Icons.play_arrow_rounded),
            color: Constants.white,
          );
        } else if (processingState != ProcessingState.completed) {
          
          return IconButton(
            onPressed: audioPlayer.pause,
            icon: const Icon(Icons.pause),
            color: Constants.white,
          );
        }
        return const Icon(
          Icons.play_arrow_rounded,
          color: Constants.white,
        );
      },
    );
  }
}
