import 'question.dart';

class QuizAvenger {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question("Winter Soldier Has A Vibranium Arm", true),
    Question("Captain America Is From Brooklyn", true),
    Question("Ned Knows Spider-Man’s Identity", true),
    Question("Nick Fury Worked With S.H.I.E.L.D.", true),
    Question("Shuri Is The Black Panther", false),
    Question("Black Widow’s Real Name Is Diana Prince", false),
    Question("Winter Soldier’s Real Name Is Bucky Barnes", true),
    Question("Goose The Cat Is Why Nick Fury Wears An Eye Patch", true),
    Question("Thor Has A Sister Named Hela", true),
    Question("Captain America And Bucky Barnes Are Brothers", false),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int totalQuestion() {
    return _questionBank.length;
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
