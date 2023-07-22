import 'package:flutter/material.dart';

import 'package:adv_basics/questions_summary/summary_item.dart';
import 'package:adv_basics/_common/structs.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.data,
  });

  final List<Map<SummaryDataKey, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: data.map((item) {
            return SummaryItem(item);
          }).toList(),
        ),
      ),
    );
  }
}
