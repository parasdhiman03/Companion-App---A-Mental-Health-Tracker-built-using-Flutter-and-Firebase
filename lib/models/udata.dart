class Udata {
  final String mood;
  final String name;
  final String profession;
  final int age;
  int quizScore; // New field to store the quiz score

  Udata({
    required this.mood,
    required this.profession,
    required this.age,
    required this.name,
    required this.quizScore, // Include the quiz score in the constructor
  });

  // Add a factory method to convert data from Firestore to Udata
  factory Udata.fromFirestore(Map<String, dynamic> data) {
    return Udata(
      mood: data['mood'] ?? '',
      profession: data['profession'] ?? '',
      age: data['age'] ?? 0,
      name: data['name'] ?? '',
      quizScore: data['quiz_scores'] ?? 0,
    );
  }
}
