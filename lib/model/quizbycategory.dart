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


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'level': level,
      'questions': questions.map((x) => x.toMap()).toList(),
      'v': v,
    };
  }

  factory QuizByCategory.fromMap(Map<String, dynamic> map) {
    return QuizByCategory(
      id: map['id'] as String,
      category: map['category'] as String,
      level: map['level'] as String,
      questions: List<Question>.from((map['questions'] as List<int>).map<Question>((x) => Question.fromMap(x as Map<String,dynamic>),),),
      v: map['v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizByCategory.fromJson(String source) => QuizByCategory.fromMap(json.decode(source) as Map<String, dynamic>);
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


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'options': options.map((x) => x.toMap()).toList(),
      'answerId': answerId,
      'id': id,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] as String,
      options: List<Option>.from((map['options'] as List<int>).map<Option>((x) => Option.fromMap(x as Map<String,dynamic>),),),
      answerId: map['answerId'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Option {
    String id;
    String text;

    Option({
        required this.id,
        required this.text,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['id'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source) as Map<String, dynamic>);
}
