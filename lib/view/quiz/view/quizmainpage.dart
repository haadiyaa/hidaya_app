import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/quizbloc/quiz_bloc.dart';
import 'package:hidhayah/model/quizbycategory.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quiz/view/scorepage.dart';
import 'package:hidhayah/view/quiz/widgets/quizshimmer.dart';

class QuizmainpageWrapper extends StatelessWidget {
  const QuizmainpageWrapper(
      {super.key, required this.category, required this.level});

  final String category;
  final String level;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: QuizmainPage(
        category: category,
        level: level,
      ),
    );
  }
}

class QuizmainPage extends StatefulWidget {
  final String category;
  final String level;
  const QuizmainPage({super.key, required this.category, required this.level});

  @override
  State<QuizmainPage> createState() => _QuizmainPageState();
}

class _QuizmainPageState extends State<QuizmainPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context).add(QuizByCategoryAndLevelEvent(
        category: widget.category, level: widget.level));
  }

  late QuizByCategoryList quizByCategoryList;
  int currentIndex = 0;
  resetColor() {
    quizOptionColor = [
      Constants.greenLight,
      Constants.greenLight,
      Constants.greenLight,
      Constants.greenLight,
    ];
  }

  List<Color> quizOptionColor = [
    Constants.greenLight,
    Constants.greenLight,
    Constants.greenLight,
    Constants.greenLight,
  ];
  List<String> ids=[];

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
              child: BlocBuilder<QuizBloc, QuizState>(
                builder: (context, state) {
                  if (state.currentIndex != currentIndex) {
                    currentIndex = state.currentIndex;
                  }
                  if (state.isLast == true) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (timeStamp) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ScorePageWrapper(ids: ids,)));
                      },
                    );
                  }
                  // if (state is QuizError) {
                  //   return const Center(
                  //     child: Text('Category Empty!'),
                  //   );
                  // }
                  if (state.quizByCategoryList != null) {
                    quizByCategoryList = state.quizByCategoryList!;
                    print('object ${quizByCategoryList.quizzes.length}');
                    if (quizByCategoryList.quizzes.isEmpty) {
                      return const Center(
                        child: Text('No Questions in this category!'),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  'Question ${currentIndex + 1} of ${quizByCategoryList.quizzes[1].questions.length}'),
                            ],
                          ),
                        ),
                        Constants.height10,
                        Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Constants.greenLight,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${currentIndex + 1}.',
                                style: TextStyles.size20,
                              ),
                              Expanded(
                                child: Text(
                                  quizByCategoryList.quizzes[1]
                                      .questions[currentIndex].question,
                                  style: TextStyles.size20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Constants.height15,
                        Expanded(
                          child: ListView.builder(
                            itemCount: quizByCategoryList.quizzes[1]
                                .questions[currentIndex].options.length,
                            itemBuilder: (BuildContext context, int index) {
                              var correctAns = quizByCategoryList
                                  .quizzes[1].questions[currentIndex].answerId;
                              // if (state.color != Constants.greenLight) {
                              //   quizOptionColor[index] = state.color;
                              // }

                              return GestureDetector(
                                onTap: () {
                                  ids.add(quizByCategoryList
                                            .quizzes[1]
                                            .questions[currentIndex]
                                            .options[index]
                                            .id);
                                  print(quizByCategoryList
                                      .quizzes[1]
                                      .questions[currentIndex]
                                      .options[index]
                                      .id);
                                  setState(() {
                                    if (correctAns.toString() ==
                                        quizByCategoryList
                                            .quizzes[1]
                                            .questions[currentIndex]
                                            .options[index]
                                            .id) {
                                      quizOptionColor[index] =
                                          Constants.gradGreenLight;
                                    } else {
                                      quizOptionColor[index] =
                                          Constants.gradRedDark;
                                    }
                                  });
                                  Future.delayed(
                                    const Duration(seconds: 1),
                                    () {
                                      resetColor();
                                      BlocProvider.of<QuizBloc>(context).add(
                                          ChangeIndexEvent(
                                              currentIndex: currentIndex,
                                              total: quizByCategoryList
                                                      .quizzes[1]
                                                      .questions
                                                      .length -
                                                  1));
                                    },
                                  );
                                },
                                child: Container(
                                  width: size.width * 0.9,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: quizOptionColor[index],
                                  ),
                                  child: Text(
                                    '${Constants.quizOptions[index]} ${quizByCategoryList.quizzes[1].questions[currentIndex].options[index].text.toString()}',
                                    style: TextStyles.size18,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return QuizShimmer(size: size);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
