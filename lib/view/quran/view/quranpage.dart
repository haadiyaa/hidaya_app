import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/suralistbloc/surahlist_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class QuranpageWrapper extends StatelessWidget {
  const QuranpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahlistBloc(),
      child: QuranPage(),
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
    BlocProvider.of<SurahlistBloc>(context).add(SurahFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: 20,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return SurahListWidget(title: 'Al-Faatiha',subtitle: 'The Opening',num: '1',);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SurahListWidget extends StatelessWidget {
  const SurahListWidget({
    super.key, required this.title, required this.subtitle, required this.num,
  });
  final String title;
  final String subtitle;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            num,
            style: TextStyles.size20,
          ),
          const Spacer(
            flex: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.prayerTodayStyle,
              ),
              Text(
                subtitle,
                style: TextStyles.qurantext,
              ),
            ],
          ),
          const Spacer(
            flex: 10,
          ),
          // const Icon(
          //   Icons.play_arrow_rounded,
          //   color: Constants.white,
          // ),
          // const Spacer(flex: 2,),
          const Icon(
            Icons.bookmark_border,
            color: Constants.white,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
