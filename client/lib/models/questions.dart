class Question {
  String question;
  List<String> options;
  String answer;

  Question({required this.question, required this.answer, required this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        question: json['question'] as String,
        options: List<String>.from(json['options'] as List),
        answer: json['answer'] as String);
  }
}
