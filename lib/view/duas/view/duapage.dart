import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/duabloc/dua_bloc.dart';
import 'package:hidhayah/model/duamodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/duas/view/duaindividul.dart';

class DuapageWrapper extends StatelessWidget {
  const DuapageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DuaBloc(),
      child: const Duapage(),
    );
  }
}

class Duapage extends StatefulWidget {
  const Duapage({super.key});

  @override
  State<Duapage> createState() => _DuapageState();
}

class _DuapageState extends State<Duapage> {
  late Duamodel duaModel;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DuaBloc>(context).add(FetchDuas());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('Duas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: BlocBuilder<DuaBloc, DuaState>(
                builder: (context, state) {
                  if (state is DuaCetgoriesState) {
                    duaModel=state.duaModel;
                    final list=duaModel.english;
                    if (list!=null) {
                      return ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Constants.height10;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>DuaIndividualPageWrapper(title: list[index].title!,url: list[index].text!,)));
                          },
                          child: Container(
                            width: size.width * 0.9,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.lightgreengrey,
                            ),
                            child: Text(list[index].title!.toUpperCase(),style: TextStyles.forgotPasStyle,),
                          ),
                        );
                      },
                    );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
