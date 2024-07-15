import 'package:arabic_font/arabic_font.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/model/surahmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quran/widgets/controlswidget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

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

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

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
            SizedBox(),
            Row(
              children: [
                Controls(
                  audioPlayer: _audioPlayer,
                  // positionDataStream: _positionDataStream,
                ),
                Constants.width8,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                  ),
                  color: Constants.white,
                ),
                Constants.width10,
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
          ],
        ),
        // StreamBuilder(
        //   stream: _positionDataStream,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     final PositionData? positionData = snapshot.data;
        //     return ProgressBar(
        //       barHeight: 4,
        //       baseBarColor: Constants.greenLight,
        //       bufferedBarColor: const Color.fromARGB(255, 149, 190, 169),
        //       progressBarColor: Constants.greenDark,
        //       thumbColor: Constants.greenDark,
        //       thumbRadius: 5,
        //       timeLabelTextStyle: TextStyle(fontSize: 10),
        //       progress: positionData?.position ?? Duration.zero,
        //       buffered: positionData?.bufferedPosition ?? Duration.zero,
        //       total: positionData?.duration ?? Duration.zero,
        //       onSeek: _audioPlayer.seek,
        //     );
        //   },
        // ),
      ],
    );
  }
}

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}
