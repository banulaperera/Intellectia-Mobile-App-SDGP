class Question {
  final int id, answer;
  final String question;
  final List<String> options;
 
  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}
 
// ignore: constant_identifier_names
const List sample_data = [
  {
    "id": 1,
    "question": "Which of the following is a component of the DBMS?",
    "options": ['Data', 'Data Languages', 'Data Manager', 'All of the above'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question": "Who created the first DBMS?",
    "options": [
      'Edgar Frank Codd',
      'Charles Bachman',
      'Charles Babbage',
      'Sharon B. Codd'
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Which of the following is not a type of database?",
    "options": ['Hierarchical', 'Network', 'Distributed', 'Decentralized'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Which of the following is not an example of DBMS?",
    "options": ['MySQL', 'Microsoft Acess', 'IBM DB2', 'Google'],
    "answer_index": 3,
  },
];
 