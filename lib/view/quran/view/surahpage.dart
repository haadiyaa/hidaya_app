import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/suralistbloc/surahlist_bloc.dart';
import 'package:hidhayah/model/surahmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahlistBloc>(context)
        .add(SurahFetchEvent(index: widget.index));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: size.height,
        child: BlocBuilder<SurahlistBloc, SurahlistState>(
          builder: (context, state) {
            if (state is SurahFetchState) {
              print('surahfetch state');
              surahModel = state.surahModel;
              // final data=surahModel.data;
              // revelation=data!.revelation;
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Constants.greenDark,
                    ),
                    child: Text(
                      surahModel.data!.revelation!.en! ?? 'loading..',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: surahModel.data!.numberOfVerses!,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 0.5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Constants.greenLight)),
                                    child: Text(
                                        '${surahModel.data!.verses![index].number!.inSurah}'),
                                  ),
                                  Constants.width8,
                                  SizedBox(
                                    width: size.width * 0.8,
                                    child: Text(
                                      surahModel
                                          .data!.verses![index].text!.arab!,
                                      style: TextStyles.arabicFont,
                                    ),
                                  ),
                                ],
                              ),
                              Constants.height5,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.8,
                                    child: Text(
                                      surahModel.data!.verses![index].text!
                                          .transliteration!.en!,
                                      style: TextStyles.arabicTransFont,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.8,
                                    child: Text(
                                      surahModel.data!.verses![index]
                                          .translation!.en!,
                                      style: TextStyles.engFont,
                                    ),
                                  ),
                                ],
                              ),
                              Constants.height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow_rounded,
                                        color: Constants.white,
                                      ),
                                      Constants.width8,
                                      Icon(
                                        Icons.bookmark_border,
                                        color: Constants.white,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: Text('dd'),
            );
          },
        ),
      ),
    );
  }
}
