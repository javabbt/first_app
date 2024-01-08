import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() {
    return _GradientContainer();
  }
}

class _GradientContainer extends State<GradientContainer> {
  var activeDiceNumber = 2;

  void roll() {
    setState(() {
      activeDiceNumber = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 94, 47, 175),
          Color.fromARGB(255, 164, 92, 25),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/dice-$activeDiceNumber.png",
            width: 200,
          ),
          TextButton(
            onPressed: roll,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 38),
                padding: const EdgeInsets.only(top: 15)),
            child: const Text(
              "Roll",
            ),
          )
        ],
      )),
    );
  }
}
