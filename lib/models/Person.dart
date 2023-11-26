class Person {
  final String username;
  final List<int> score; // Change the score to be a List<int>

  Person({required this.username, List<int>? score})
      : score = score ?? []; // Initialize score as an empty list if not provided

  String get getUsername {
    return username;
  }
}
