import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void startQuizFunc(){
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    setState(() {
      if (selectedAnswers.length == questions.length){
        selectedAnswers.clear();
        activeScreen = "results-screen";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = StartScreen(startQuizFun: startQuizFunc);

    if (activeScreen == "question-screen"){
      currentWidget = QuestionScreen(chooseAnswerFun: chooseAnswer,);
    }

    if (activeScreen == "results-screen"){
      currentWidget = const ResultScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: currentWidget,
        ),
      ),
    );
  }
}

