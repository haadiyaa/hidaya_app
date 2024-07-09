import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/bloc/suralistbloc/surahlist_bloc.dart';
import 'package:hidhayah/main.dart';
import 'package:hidhayah/model/surahmodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quran/widgets/shimmerlistview.dart';
import 'package:hidhayah/view/quran/widgets/surahayatwidget.dart';
import 'package:shimmer/shimmer.dart';

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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahlistBloc>(context)
        .add(SurahFetchEvent(index: widget.index));
    _controllerOne = ScrollController();
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Juz: ${surahModel.data!.verses![0].meta!.juz}'),
                        Text(
                          surahModel.data!.revelation!.en! ?? 'loading..',
                          textAlign: TextAlign.center,
                        ),
                        Text('Aayat: ${surahModel.data!.numberOfVerses}')
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
                            // Text(
                            //   surahModel.data!.preBismillah!.text!.transliteration!.en!,
                            //   style: TextStyles.arabicFont,
                            // ),
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
                        separatorBuilder: (BuildContext context, int index) {
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
              );
            }
            return ShimmerlistView(size: size);
          },
        ),
      ),
    );
  }
}
