import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/main.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class QuizpageWrapper extends StatelessWidget {
  const QuizpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizPage();
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      backgroundColor: Constants.greenDark,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Score Board',
                  style: TextStyle(color: const Color.fromARGB(255, 138, 179, 158),fontSize: 20.sp,fontWeight: FontWeight.bold),
                ),
                Constants.height15,
                SizedBox(
                  height: size.height * 0.4,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Constants.height5,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        dense: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: Constants.greenLight,
                        textColor: Constants.black,
                        titleTextStyle: const TextStyle(color: Constants.black),
                        leading: Text(
                          '${index + 1} .',
                          style: TextStyles.size18,
                        ),
                        title:  Text(
                          'user',
                          style: TextStyles.size18,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.navigate_next_sharp,
                        color: Constants.greenDark,
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.greenLight,
                        foregroundColor: Constants.greenDark,
                        elevation: 10
                      ),
                      label: const Text('START QUIZ'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
