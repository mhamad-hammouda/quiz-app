class Person {
  final String username;
  final List<int> score; // Change the score to be a List<int>
  final String age; // Add age as a String property

  Person({required this.username, List<int>? score, required this.age})
      : score = score ?? []; // Initialize score as an empty list if not provided

  String get getUsername {
    return username;
  }
}
