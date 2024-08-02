import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/quizbloc/quiz_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class ScorePageWrapper extends StatelessWidget {
  const ScorePageWrapper({super.key, required this.ids});
  final List<String> ids;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: ScorePage(ids: ids,),
    );
  }
}

class ScorePage extends StatefulWidget {
  final List<String> ids;
  ScorePage({super.key, required this.ids});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

  late String score;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context).add(SubmitAnswerEvent(answers: widget.ids));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark,
      body: Center(child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is SubmitState) {
            score=state.score;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Congratulatons!\nYour score is: $score",
                  style: TextStyles.dashboardHeadStyle,
                ),
                Constants.height20,
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.greenLight,
                    foregroundColor: Constants.greenDark,
                    elevation: 10,
                  ),
                  child: const Text('Go to dashboard'),
                ),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Congratulatons!\nYour score is: ...",
                style: TextStyles.dashboardHeadStyle,
              ),
              Constants.height20,
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.greenLight,
                  foregroundColor: Constants.greenDark,
                  elevation: 10,
                ),
                child: const Text('Go to dashboard'),
              ),
            ],
          );
        },
      )),
    );
  }
}
