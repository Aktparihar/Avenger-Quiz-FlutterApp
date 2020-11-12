import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz-dart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

QuizAvenger question = QuizAvenger();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Avenger Quizz"),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalScore = 1;
  int totalQuestion = question.totalQuestion();
  List<Icon> scoreCard = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = question.getAnswer();
    setState(() {
      if (question.isFinished()) {
        Alert(
          context: context,
          type: AlertType.success,
          title: 'Completed',
          desc: "You Scored $totalScore out of $totalQuestion",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              width: 120,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ).show();
        question.reset();
        totalScore = 1;
        scoreCard = [];
      } else {
        if (correctAnswer == userAnswer) {
          totalScore++;
          scoreCard.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreCard.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        question.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                question.getQuestion(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Source Sans Pro",
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                "True",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                "False",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreCard,
        )
      ],
    );
  }
}
