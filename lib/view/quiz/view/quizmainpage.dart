import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/quizbloc/quiz_bloc.dart';
import 'package:hidhayah/model/quizbycategory.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/quiz/widgets/quizshimmer.dart';
import 'package:shimmer/shimmer.dart';

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
  // gotoNextQuestion() {
  //   resetColor();
  //   currentIndex++;
  // }

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
                    if (state is LastQuestionState) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: const Text(
                              'Congratulations!\nYou have Got 5 Marks!'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                              },
                              child: const Text('Go to DashBoard'),
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is ChengeIndexState) {
                      currentIndex = state.index;
                      BlocProvider.of<QuizBloc>(context).add(
                          QuizByCategoryAndLevelEvent(
                              category: widget.category, level: widget.level));
                    }
                    if (state is QuizByCategoryLevelState) {
                      quizByCategoryList = state.quizByCategoryList;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    'Question ${currentIndex + 1} of ${quizByCategoryList.quizzes.length}'),
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
                                    '${quizByCategoryList.quizzes[currentIndex].questions![0].question}',
                                    style: TextStyles.size20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Constants.height15,
                          Expanded(
                            child: ListView.builder(
                              itemCount: quizByCategoryList
                                  .quizzes[currentIndex]
                                  .questions![0]
                                  .options!
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                var correctAns = quizByCategoryList
                                    .quizzes[currentIndex].questions![0].answer;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (correctAns.toString() ==
                                          quizByCategoryList
                                              .quizzes[currentIndex]
                                              .questions![0]
                                              .options![index]) {
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
                                                        .quizzes.length -
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
                                      '${Constants.quizOptions[index]} ${quizByCategoryList.quizzes[currentIndex].questions![0].options![index]}',
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
                )),
          ),
        ),
      ),
    );
  }
}
