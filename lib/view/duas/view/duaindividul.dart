import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/bloc/duabloc/dua_bloc.dart';
import 'package:hidhayah/model/duamodel.dart';
import 'package:hidhayah/model/duasinglemodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class DuaIndividualPageWrapper extends StatelessWidget {
  const DuaIndividualPageWrapper(
      {super.key, required this.title, required this.url});
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DuaBloc(),
      child: DuaIndividualPage(
        title: title,
        url: url,
      ),
    );
  }
}

class DuaIndividualPage extends StatefulWidget {
  const DuaIndividualPage({super.key, required this.title, required this.url});
  final String title;
  final String url;

  @override
  State<DuaIndividualPage> createState() => _DuaIndividualPageState();
}

class _DuaIndividualPageState extends State<DuaIndividualPage> {
  late Dua duaModel;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DuaBloc>(context).add(FetchIndividualDuas(url: widget.url));
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
        width: size.width,
        child: BlocBuilder<DuaBloc, DuaState>(
          builder: (context, state) {
            if (state is DuaSingleState) {
              duaModel = state.duaModel;
              return ListView.separated(
                itemCount: duaModel.duaItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(thickness: 0.5);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${index+1}'),
                        SizedBox(
                          child: Text(
                            duaModel.duaItems[index].arabicText!,//.substring(1,duaModel.duaItems[index].arabicText!.length-2),
                            style: ArabicTextStyle(
                                arabicFont: ArabicFont.amiri,
                                fontSize: 25.sp,
                                height: 2.5),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Constants.height8,
                        SizedBox(
                          child: Text(
                            duaModel.duaItems[index].languageArabicTranslatedText!,
                            style: TextStyles.arabicTransFont,
                          ),
                        ),
                        Constants.height8,
                        SizedBox(
                          child: Text(
                            duaModel.duaItems[index].translatedText!.substring(1,duaModel.duaItems[index].translatedText!.length-1),
                            style: TextStyles.engFont,
                          ),
                        ),
                        Constants.height10,
                        SizedBox(
                          child: Text(
                            'Repeat ${duaModel.duaItems[index].repeat} times',
                            style: TextStyles.arabicTransFont,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return ListView.separated(
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 0.5);
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      child: Text(
                        'kuytfdcghgfcfghjhgfg',
                        style: ArabicTextStyle(
                            arabicFont: ArabicFont.amiri,
                            fontSize: 25.sp,
                            height: 2.5),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Constants.height8,
                    SizedBox(
                      child: Text(
                        'fghnbvcdfghvcx',
                        style: TextStyles.arabicTransFont,
                      ),
                    ),
                    Constants.height8,
                    SizedBox(
                      child: Text(
                        'cvbnmjhgfghjkjhgf',
                        style: TextStyles.engFont,
                      ),
                    ),
                    Constants.height10,
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
