import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/suralistbloc/surahlist_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/quran/widgets/surahlistshimmerwidget.dart';
import 'package:hidhayah/view/quran/widgets/surahlistwidget.dart';
import 'package:shimmer/shimmer.dart';

class QuranpageWrapper extends StatelessWidget {
  const QuranpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahlistBloc(),
      child: const QuranPage(),
    );
  }
}

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahlistBloc>(context).add(SurahlistFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('Quran'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              BlocBuilder<SurahlistBloc, SurahlistState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: 114,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 0.5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        if (state is SurahlistFetchState) {
                          final surahmodel = state.surahListModel.data[index];
                          return SurahListWidget(
                            title: surahmodel.name.transliteration.en,
                            subtitle:
                                '${surahmodel.name.translation.en} (${surahmodel.numberOfVerses})',
                            num: ' ${surahmodel.number}',
                          );
                        }
                        return SurahlistShimmerWidget(size: size);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
