import 'package:flutter/material.dart';

import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:adv_basics/_common/structs.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestartQuiz,
  });

  final List<String> selectedAnswers;
  final void Function() onRestartQuiz;

  List<Map<SummaryDataKey, Object>> getSummaryData() {
    final List<Map<SummaryDataKey, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        SummaryDataKey.questionIndex: i,
        SummaryDataKey.question: questions[i].text,
        SummaryDataKey.correctAnswer: questions[i].answers[0],
        SummaryDataKey.selectedAnswer: selectedAnswers[i],
        SummaryDataKey.isCorrect: selectedAnswers[i] == questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<SummaryDataKey, Object>> summaryData = getSummaryData();
    final int numTotalQuestions = questions.length;
    final int numCorrectAnswers = summaryData
        .where((Map<SummaryDataKey, Object> answer) =>
            answer[SummaryDataKey.isCorrect] == true)
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(data: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
