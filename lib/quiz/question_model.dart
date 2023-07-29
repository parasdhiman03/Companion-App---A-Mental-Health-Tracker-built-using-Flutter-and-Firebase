class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final int score;

  Answer(this.answerText, this.score);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Over the past two weeks, how often have you experienced feelings of sadness or hopelessness?",
    [
      Answer("Not at all",0),
      Answer("A few days",1),
      Answer("Several Days",2),
      Answer("Most Days",3),
    ],
  ));

  list.add(Question(
    "Are you finding it difficult to enjoy activities that you once found pleasurable?",
    [
      Answer("Not at all", 0),
      Answer("Sometimes", 1),
      Answer("Often", 2),
      Answer("Almost never", 3),
    ],
  ));

  list.add(Question(
    "How frequently are you experiencing anxiety or excessive worry?",
    [
      Answer("Rarely", 0),
      Answer("Sometimes", 1),
      Answer("Often", 2),
      Answer("Almost every day", 3),
    ],
  ));

  list.add(Question(
    "Are you facing difficulties falling asleep or staying asleep?",
    [
      Answer("Not at all", 0),
      Answer("Occasionally", 1),
      Answer("Frequently", 2),
      Answer("Most nights", 3),
    ],
  ));

  return list;
}
