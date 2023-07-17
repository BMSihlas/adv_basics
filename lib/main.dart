import 'package:flutter/material.dart';

import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/start_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 168),
          child: StartScreen(),
        ),
      ),
    ),
  );
}
