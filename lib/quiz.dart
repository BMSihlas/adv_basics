import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/_common/structs.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Screens activeScreen = Screens.startScreen;

  void switchScreen(Screens screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      switchScreen(Screens.resultsScreen);
      // setState(() {
      //   activeScreen = Screens.resultsScreen;
      //   // selectedAnswers.removeRange(0, selectedAnswers.length);
      // });
    }
  }

  void restartQuiz() {
    switchScreen(Screens.startScreen);
    selectedAnswers.removeRange(0, selectedAnswers.length);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(() {
      switchScreen(Screens.questionsScreen);
    });

    if (activeScreen == Screens.questionsScreen) {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == Screens.startScreen) {
      screenWidget = StartScreen(() {
        switchScreen(Screens.questionsScreen);
      });
    } else if (activeScreen == Screens.resultsScreen) {
      screenWidget = ResultsScreen(selectedAnswers: selectedAnswers, onRestartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          const Color.fromARGB(255, 78, 13, 151),
          const Color.fromARGB(255, 107, 15, 168),
          child: screenWidget,
        ),
      ),
    );
  }
}
