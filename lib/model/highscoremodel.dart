// To parse this JSON data, do
//
//     final highScore = highScoreFromJson(jsonString);

import 'dart:convert';

List<HighScore> highScoreFromJson(String str) => List<HighScore>.from(json.decode(str).map((x) => HighScore.fromJson(x)));

String highScoreToJson(List<HighScore> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HighScore {
    String? username;
    int totalScore;

    HighScore({
        this.username,
        required this.totalScore,
    });

    factory HighScore.fromJson(Map<String, dynamic> json) => HighScore(
        username: json["username"],
        totalScore: json["totalScore"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "totalScore": totalScore,
    };
}
