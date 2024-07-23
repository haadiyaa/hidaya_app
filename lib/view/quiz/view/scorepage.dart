import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quiz/view/quizpage.dart';

class ScorePageWrapper extends StatelessWidget {
  const ScorePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScorePage();
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulatons!\nYour score is: 5",
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
        ),
      ),
    );
  }
}
