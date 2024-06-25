import 'package:flutter/material.dart';
import 'package:quizler_app/questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const quizApp());
}

Questionbank newQuestionBank = Questionbank();

class quizApp extends StatelessWidget {
  const quizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override



  void checkAnswer(bool userAnswer){
    bool correctAnswer = userAnswer;
    bool currentQuestion = newQuestionBank.isMaxQuestion();

    if(currentQuestion == true){
      Alert(
        type: AlertType.error,
        title: "RESULT",
        desc: "Your Result is Here",
        buttons: [
          DialogButton(
            child: Text(
              "Play Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                scoreKeeper = [];
              });
            },
            width: 120,
          )
        ], context: context,
      ).show();
    }

    if(correctAnswer == newQuestionBank.getAnswer()){
      scoreKeeper.add(
          Icon(Icons.check_circle, color: Colors.greenAccent,)
      );
    } else {
      scoreKeeper.add(
          Icon(Icons.cancel_rounded, color: Colors.redAccent,)
      );
    }
    setState(() {
      newQuestionBank.nextQuestion();
      currentIndex = newQuestionBank.currentIndex();
    });
  }

  List<Icon> scoreKeeper = [];
  late int currentIndex = 0;


  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex:3, child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image(image: AssetImage('images/bird$currentIndex.jpg'),),
        )),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                newQuestionBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Padding(
          padding: EdgeInsets.all(10.0),
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),

              ),
              onPressed: () {
                checkAnswer(true);
              }, child: Text('True',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
          )),
        ),
        ),
        Expanded(child: Padding(
          padding: EdgeInsets.all(10.0),
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),

              ),
              onPressed: () {
                checkAnswer(false);
              }, child: Text('False',
            style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),),
        Row(children: scoreKeeper,),
      ],
    );
  }
}





