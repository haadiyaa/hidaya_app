
class QuizByCategory {
    String? id;
    String? category;
    String? level;
    List<Questions>? questions;
    int? v;

    QuizByCategory({this.id, this.category, this.level, this.questions, this.v});

    QuizByCategory.fromJson(Map<String, dynamic> json) {
        if(json["_id"] is String) {
            id = json["_id"];
        }
        if(json["category"] is String) {
            category = json["category"];
        }
        if(json["level"] is String) {
            level = json["level"];
        }
        if(json["questions"] is List) {
            questions = json["questions"] == null ? null : (json["questions"] as List).map((e) => Questions.fromJson(e)).toList();
        }
        if(json["__v"] is int) {
            v = json["__v"];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["category"] = category;
        _data["level"] = level;
        if(questions != null) {
            _data["questions"] = questions?.map((e) => e.toJson()).toList();
        }
        _data["__v"] = v;
        return _data;
    }
}

class Questions {
    String? questionId;
    String? question;
    List<String>? options;
    String? answer;
    String? id;

    Questions({this.questionId, this.question, this.options, this.answer, this.id});

    Questions.fromJson(Map<String, dynamic> json) {
        if(json["questionId"] is String) {
            questionId = json["questionId"];
        }
        if(json["question"] is String) {
            question = json["question"];
        }
        if(json["options"] is List) {
            options = json["options"] == null ? null : List<String>.from(json["options"]);
        }
        if(json["answer"] is String) {
            answer = json["answer"];
        }
        if(json["_id"] is String) {
            id = json["_id"];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["questionId"] = questionId;
        _data["question"] = question;
        if(options != null) {
            _data["options"] = options;
        }
        _data["answer"] = answer;
        _data["_id"] = id;
        return _data;
    }
}