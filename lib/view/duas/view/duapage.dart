import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/duabloc/dua_bloc.dart';
import 'package:hidhayah/model/duamodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';

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
  late DuaModel duaModel;
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
                    return ListView.separated(
                      itemCount: list!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Constants.height10;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.lightgreengrey,
                          ),
                          child: Text(list[index].title!),
                        );
                      },
                    );
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
