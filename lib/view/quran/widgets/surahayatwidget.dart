import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/model/surahmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:just_audio/just_audio.dart';

class SurahAyatWidget extends StatefulWidget {
  const SurahAyatWidget({
    super.key,
    required this.surahModel,
    required this.size,
    required this.index,
  });

  final SurahModel surahModel;
  final Size size;
  final int index;

  @override
  State<SurahAyatWidget> createState() => _SurahAyatWidgetState();
}

class _SurahAyatWidgetState extends State<SurahAyatWidget> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()
      ..setUrl(widget.surahModel.data!.verses![widget.index].audio!.primary!);
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Constants.greenLight)),
              child: Text(
                  '${widget.surahModel.data!.verses![widget.index].number!.inSurah}'),
            ),
          ],
        ),
        Constants.height8,
        Constants.width8,
        SizedBox(
          width: widget.size.width * 0.9,
          child: Text(
            widget.surahModel.data!.verses![widget.index].text!.arab!,
            style: ArabicTextStyle(
                arabicFont: ArabicFont.amiri, fontSize: 25.sp, height: 2.5),
            textAlign: TextAlign.end,
          ),
        ),
        Constants.height8,
        SizedBox(
          width: widget.size.width * 0.9,
          child: Text(
            widget.surahModel.data!.verses![widget.index].text!.transliteration!
                .en!,
            style: TextStyles.arabicTransFont,
          ),
        ),
        Constants.height8,
        SizedBox(
          width: widget.size.width * 0.9,
          child: Text(
            widget.surahModel.data!.verses![widget.index].translation!.en!,
            style: TextStyles.engFont,
          ),
        ),
        Constants.height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Row(
              children: [
                Controls(audioPlayer: _audioPlayer),
                Constants.width8,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                  ),
                  color: Constants.white,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

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
