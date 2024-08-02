import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/bloc/quizbloc/quiz_bloc.dart';
import 'package:hidhayah/model/highscoremodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quiz/view/quizmainpage.dart';
import 'package:hidhayah/view/quiz/widgets/categorydialog.dart';
import 'package:hidhayah/view/quiz/widgets/leveldialog.dart';
import 'package:shimmer/shimmer.dart';

class QuizpageWrapper extends StatelessWidget {
  const QuizpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context).add(GetHighScoreEvent());
  }

  late List<HighScore> highScore;
  late String category;

  late String level;

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
                  style: TextStyle(
                      color: const Color.fromARGB(255, 138, 179, 158),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                Constants.height15,
                BlocBuilder<QuizBloc, QuizState>(
                  builder: (context, state) {
                    if (state is GetHighScoreState) {
                      highScore = state.highScore;
                      return SizedBox(
                        height: size.height * 0.4,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              Constants.height5,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              dense: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              tileColor: Constants.greenLight,
                              textColor: Constants.black,
                              titleTextStyle:
                                  const TextStyle(color: Constants.black),
                              leading: Text(
                                '${index + 1} .',
                                style: TextStyles.size18,
                              ),
                              title: Text(
                                highScore[index].username!,
                                style: TextStyles.size18,
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox(
                      height: size.height * 0.4,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Constants.height5,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            baseColor: Constants.greenDark2,
                            highlightColor: Constants.greenDark,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Constants.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                dense: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                tileColor: Constants.greenLight,
                                textColor: Constants.black,
                                titleTextStyle:
                                    const TextStyle(color: Constants.black),
                                leading: Text(
                                  '${index + 1} .',
                                  style: TextStyles.size18,
                                ),
                                title: Text(
                                  'user',
                                  style: TextStyles.size18,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.navigate_next_sharp,
                        color: Constants.greenDark,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CategoryDialog(size: size);
                          },
                        ).then(
                          (value) {
                            if (value != null) {
                              category = value.toString();
                              print(category);
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return LevelDialog(
                                      size: size, category: category);
                                },
                              ).then(
                                (selected) {
                                  if (selected != null) {
                                    String category =
                                        selected['category'].toString();
                                    String level = selected['level'].toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => QuizmainpageWrapper(
                                                  category: category,
                                                  level: level,
                                                )));
                                  }
                                },
                              );
                            }
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.greenLight,
                          foregroundColor: Constants.greenDark,
                          elevation: 10),
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
