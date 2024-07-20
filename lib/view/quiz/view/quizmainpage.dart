import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/quizbloc/quiz_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class QuizmainpageWrapper extends StatelessWidget {
  const QuizmainpageWrapper({super.key, required this.category, required this.level});

  final String category;
  final String level;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: const QuizmainPage(),
    );
  }
}

class QuizmainPage extends StatefulWidget {
  const QuizmainPage({super.key});

  @override
  State<QuizmainPage> createState() => _QuizmainPageState();
}

class _QuizmainPageState extends State<QuizmainPage> {
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.greenLight),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1.'),
                        Text('mnbvfcxsdfghnbvfghjk\nbvnbgfth'),
                      ],
                    ),
                  ),
                  Constants.height15,
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.greenLight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
