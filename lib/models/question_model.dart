// ignore_for_file: non_constant_identifier_names

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
  });

  static void addQuestion(
    int id,
    String question,
    List<String> options,
    int answerIndex,
  ) {
    sample_data.add({
      "id": id,
      "question": question,
      "options": options,
      "answer_index": answerIndex,
    });
  }
}

List<Map<String, dynamic>> sample_data = [
  {
    "id": 1,
    "question": "Python was created by Guido van ________.",
    "options": ["Rossum", "Bezos", "Gates", "Musk"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question": "What symbol is used for single-line comments in Python?",
    "options": ["//", "#", "/* */", "--"],
    "answer_index": 1
  },
  {
    "id": 3,
    "question": "What is the chemical symbol for gold?",
    "options": ["Au", "Ag", "Fe", "Pt"],
    "answer_index": 0
  },
  {
    "id": 4,
    "question": "Which of the following is not a standard Python data type?",
    "options": ["Tuple", "List", "Dictionary", "Table"],
    "answer_index": 3
  },
  {
    "id": 5,
    "question": "Which keyword is used to exit from a loop in Python?",
    "options": ["exit", "end", "quit", "break"],
    "answer_index": 3
  }
];
