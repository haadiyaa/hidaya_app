import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/suralistbloc/surahlist_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';

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
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.5,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('\ufd3eالْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ'
                                ' \ufd3f\u0661 '),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('1. in the name of Allah'),
                          ],
                        ),
                        Constants.height10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }
}
