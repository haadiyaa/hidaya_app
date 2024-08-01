import 'dart:convert';

class QuizByCategoryList {
  final List<QuizByCategory> quizzes;
  QuizByCategoryList({required this.quizzes});

  factory QuizByCategoryList.fromJson(List<dynamic> json) {
    return QuizByCategoryList(
      quizzes: json.map((map) => QuizByCategory.fromJson(map)).toList(),
    );
  }
}
// To parse this JSON data, do
//
//     final quizByCategory = quizByCategoryFromJson(jsonString);

List<QuizByCategory> quizByCategoryFromJson(String str) => List<QuizByCategory>.from(json.decode(str).map((x) => QuizByCategory.fromJson(x)));

String quizByCategoryToJson(List<QuizByCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizByCategory {
    String id;
    String category;
    String level;
    List<Question> questions;
    int v;

    QuizByCategory({
        required this.id,
        required this.category,
        required this.level,
        required this.questions,
        required this.v,
    });

    factory QuizByCategory.fromJson(Map<String, dynamic> json) => QuizByCategory(
        id: json["_id"],
        category: json["category"],
        level: json["level"],
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "level": level,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "__v": v,
    };
}

class Question {
    String question;
    List<Option> options;
    String answerId;
    String id;

    Question({
        required this.question,
        required this.options,
        required this.answerId,
        required this.id,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        answerId: json["answerId"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "answerId": answerId,
        "_id": id,
    };
}

class Option {
    String id;
    String text;

    Option({
        required this.id,
        required this.text,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["_id"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
    };
}
