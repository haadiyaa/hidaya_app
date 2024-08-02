import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
    // required this.positionDataStream,
  });
  final AudioPlayer audioPlayer;
  // final Stream<PositionData> positionDataStream;
  // int _playingAyahIndex=-1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // IconButton(
        //   onPressed: audioPlayer.seekToPrevious,
        //   icon: Icon(
        //     Icons.skip_previous_rounded,
        //     color: Constants.white,
        //   ),
        // ),
        StreamBuilder<PlayerState>(
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
            } else if (processingState == ProcessingState.buffering ||
                processingState == ProcessingState.loading) {
              return const CircularProgressIndicator();
            }
            return IconButton(
                onPressed: () => audioPlayer.seek(Duration.zero),
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  color: Constants.white,
                ));
          },
        ),
        // IconButton(
        //   onPressed: audioPlayer.seekToNext,
        //   icon: Icon(
        //     Icons.skip_next_rounded,
        //     color: Constants.white,
        //   ),
        // ),
      ],
    );
  }
}
