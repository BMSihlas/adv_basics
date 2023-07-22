import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/questions_summary/questions_identifier.dart';
import 'package:adv_basics/_common/structs.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<SummaryDataKey, Object> itemData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
            questionIndex: (itemData[SummaryDataKey.questionIndex] as int),
            isQuestionCorrect: (itemData[SummaryDataKey.isCorrect] as bool),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData[SummaryDataKey.question] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  itemData[SummaryDataKey.selectedAnswer] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  itemData[SummaryDataKey.correctAnswer] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
