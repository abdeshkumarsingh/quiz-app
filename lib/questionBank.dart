import 'package:quizler_app/question.dart';

class Questionbank {
  // List of questions as a class variable
  List<Question> _questionBanks = [
    Question(question: 'All birds have the ability to fly.', answer: false),
    Question(question: 'Birds are the only animals that have feathers.', answer: true),
    Question(question: 'Penguins can fly just like other birds.', answer: false),
    Question(question: 'All birds lay eggs.', answer: true),
    Question(question: 'The ostrich is the fastest bird on land.', answer: true),
  ];

  // Variable to keep track of current question index
  int _questionIndex = 0;

  // Constructor
  Questionbank();

  // Method to retrieve a question text by index
  String getQuestionText() {
    if (_questionIndex >= 0 && _questionIndex < _questionBanks.length) {
      return _questionBanks[_questionIndex].question;
    } else {
      return 'Invalid question index';
    }
  }

  bool getAnswer() {
    if (_questionIndex >= 0 && _questionIndex < _questionBanks.length) {
      return _questionBanks[_questionIndex].answer;
    } else {
      throw RangeError('Invalid question index: $_questionIndex');
    }
  }

  // Optional: Method to move to next question
  void nextQuestion() {
    if (_questionIndex < _questionBanks.length - 1) {
      _questionIndex++;
    } else {
      _questionIndex = 0; // or handle end of questions
    }
  }

  bool isMaxQuestion(){
    if(_questionIndex == _questionBanks.length-1){
      return true;
    }
    else{
      return false;
    }
  }
 int currentIndex(){
    return _questionIndex;
 }

}

