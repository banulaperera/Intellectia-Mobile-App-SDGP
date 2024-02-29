

class User {
  String photo;
  String firstName;
  String lastName;
  String email;
  int level;
  int noTakenQuiz;
  int noMissedQuiz;

  User({
    required this.photo,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.level,
    required this.noTakenQuiz,
    required this.noMissedQuiz,
    });

  Map<String, dynamic> toJson() {
    return {
          "photo":photo,
          "firstName": firstName,
          "lastName":lastName,
          "email":email,
          "level":level,
          "noTakenQuiz":noTakenQuiz,
          "noMissedQuiz":noMissedQuiz
    };
  }

  factory User.fromJson(dynamic json) {
      return User(
        photo:  json['photo'] as String,
        firstName: json['firstName'] as String,
        lastName:json['lastName'] as String,
        email:json['email'] as String,
        level: json['level'] as int,
        noTakenQuiz: json['noTakenQuiz'] as int,
        noMissedQuiz: json['noMissedQuiz'] as int,
      );


  }
}
