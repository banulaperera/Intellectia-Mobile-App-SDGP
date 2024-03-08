

class User {
  String photo;
  String firstName;
  String lastName;
  String email;
  int level;

  int correctedQuestions;
  int inCorrectedQuestions;
  int totalXP;
  List<int> weeklyXP;

  User({
    required this.photo,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.level,
    required this.correctedQuestions,
    required this.inCorrectedQuestions,
    required this.totalXP,
    required this.weeklyXP,
    });

  Map<String, dynamic> toJson() {
    return {
          "photo":photo,
          "firstName": firstName,
          "lastName":lastName,
          "email":email,
          "level":level,
          "correctedQuestions":correctedQuestions,
          "inCorrectedQuestions":inCorrectedQuestions,
          "totalXp":totalXP,
          "weeklyXp":weeklyXP,

    };
  }

  factory User.fromJson(dynamic json) {
      return User(
        photo: json['photo'] as String,
        firstName: json['firstName'] as String,
        lastName:json['lastName'] as String,
        email:json['email'] as String,
        level: json['level'] as int,
        correctedQuestions: json['correctedQuestion'] as int,
        inCorrectedQuestions: json['inCorrectedQuestion'] as int,
        totalXP:json['totalXP'] as int,
        weeklyXP:List<int>.from(json['weeklyXP'] as List),
      );


  }
}
