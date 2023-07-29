import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'question_model.dart';
import 'package:companion_app_main/screens/home/pro_help.dart';

import 'package:companion_app_main/screens/authenticate/authenticate.dart';
import 'package:companion_app_main/services/database.dart';
class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Mental Health Assessment",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length
              .toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.orangeAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            setState(() {
              selectedAnswer = answer;
              score +=
                  answer.score; // Update the score based on the selected answer
            });
          }
        },
      ),
    );
  }


  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score

            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  _showScoreDialog() {
    String message;
    if (score == 0) {
      message = "You have an excellent mental health!";
    } else if (score == 1) {
      message = "You have a good mental health.";
    } else if (score == 2) {
      message = "You have bad mental health.";
    } else {
      message =
      "You have a very poor mental health. Please consult a therapist.";
    }

    void dispose() {
      // When the QuizScreen is disposed (e.g., when navigating back to the home screen),
      // update the quiz score in the database if it is not null.
      String? getCurrentUserId() {
        final User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return user.uid;
        } else {
          return null;
        }
      }

      if (score != 0) {
        final String? userId = getCurrentUserId();
        if (userId != null) {
          DatabaseService(uid: userId).updateQuizScore(userId,score);
        }
        super.dispose();
      }
    }


    return AlertDialog(
      title: Text(
        "Result",
        style: TextStyle(color: score <= 2 ? Colors.green : Colors.redAccent),
      ),
      content: Text(message),
      actions: [
        ElevatedButton(
          child: const Text("Restart"),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            });
          },
        ),
        ElevatedButton(
          child: const Text("Get Professional Help"),
          onPressed: () {
            Navigator.pop(context); // Close the score dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfessionalHelpPage(), // Navigate to the ProfessionalHelpPage
              ),
            );
          },
        ),
      ],
    );
  }


}
