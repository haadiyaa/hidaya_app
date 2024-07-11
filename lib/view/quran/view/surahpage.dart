import 'package:arabic_font/arabic_font.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/bloc/suralistbloc/surahlist_bloc.dart';
import 'package:hidhayah/model/surahmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/quran/widgets/controlswidget.dart';
import 'package:hidhayah/view/quran/widgets/shimmerlistview.dart';
import 'package:hidhayah/view/quran/widgets/surahayatwidget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class SurahPageWrapper extends StatelessWidget {
  final String index;
  final String title;
  const SurahPageWrapper({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahlistBloc(),
      child: Surahpage(
        title: title,
        index: index,
      ),
    );
  }
}

class Surahpage extends StatefulWidget {
  final String index;
  final String title;
  const Surahpage({super.key, required this.index, required this.title});

  @override
  State<Surahpage> createState() => _SurahpageState();
}

class _SurahpageState extends State<Surahpage> {
  late SurahModel surahModel;
  late Revelation? revelation;
  ScrollController? _controllerOne;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    print(' index: ${widget.index}');
    final String ind = widget.index;
    const String url =
        'https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/';
    final String audioUrl = '$url$ind.mp3';
    super.initState();
    BlocProvider.of<SurahlistBloc>(context)
        .add(SurahFetchEvent(index: widget.index));
    _controllerOne = ScrollController();
    _audioPlayer = AudioPlayer();
    // ..setUrl(audioUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Controls(
            audioPlayer: _audioPlayer,
            positionDataStream: _positionDataStream,
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: BlocBuilder<SurahlistBloc, SurahlistState>(
          builder: (context, state) {
            if (state is SurahFetchState) {
              print('surahfetch state');
              surahModel = state.surahModel;
              const String baseUrl =
                  'https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/';
              final String audioUrl = '$baseUrl${surahModel.data!.number}.mp3';
              _audioPlayer.setUrl(audioUrl);
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Constants.greenDark,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    'Juz: ${surahModel.data!.verses![0].meta!.juz}'),
                                Text(
                                  surahModel.data!.revelation!.en! ??
                                      'loading..',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                    'Aayat: ${surahModel.data!.numberOfVerses}')
                              ],
                            ),
                          ],
                        ),
                      ),
                      Constants.height10,
                      surahModel.data!.preBismillah == null
                          ? const SizedBox()
                          : Column(
                              children: [
                                Text(
                                  surahModel.data!.preBismillah!.text!.arab!,
                                  style: ArabicTextStyle(
                                      arabicFont: ArabicFont.amiri,
                                      fontSize: 25.sp),
                                ),
                                Constants.height10,
                              ],
                            ),
                      Expanded(
                        child: Scrollbar(
                          controller: _controllerOne,
                          radius: const Radius.circular(10),
                          thickness: 6,
                          // thumbVisibility: true,
                          child: ListView.separated(
                            controller: _controllerOne,
                            itemCount: surahModel.data!.numberOfVerses!,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                thickness: 0.5,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: SurahAyatWidget(
                                  surahModel: surahModel,
                                  size: size,
                                  index: index,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(color: Constants.greenLight,borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      child: StreamBuilder(
                        stream: _positionDataStream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          final PositionData? positionData = snapshot.data;
                          return ProgressBar(
                            barHeight: 4,
                            baseBarColor: Constants.greenLight,
                            bufferedBarColor:
                                const Color.fromARGB(255, 149, 190, 169),
                            progressBarColor: Constants.greenDark,
                            thumbColor: Constants.greenDark,
                            thumbRadius: 5,
                            timeLabelTextStyle: TextStyle(fontSize: 10),
                            progress: positionData?.position ?? Duration.zero,
                            buffered:
                                positionData?.bufferedPosition ?? Duration.zero,
                            total: positionData?.duration ?? Duration.zero,
                            onSeek: _audioPlayer.seek,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return ShimmerlistView(size: size);
          },
        ),
      ),
    );
  }
}
