import 'package:brain_train_app/buttons.dart';
import 'package:flutter/material.dart';
import 'attention/exercise1.dart';
import 'memory/memory.dart';
import 'linguistic/exercise1.dart';

class ImprovementSelection extends StatefulWidget {
  const ImprovementSelection({super.key});

  @override
  State<ImprovementSelection> createState() => _ImprovementSelectionState();
}

class _ImprovementSelectionState extends State<ImprovementSelection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
          top: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WHAT WOULD YOU LIKE TO IMPROVE?",
              style: TextStyle(
                fontSize: size.width / 13,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.03 * size.height),
            Text(
              "When you click on the button, you will be transported to the specific quiz part.",
              style: TextStyle(fontSize: size.width / 23),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.01 * size.height),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: size.width / 23,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                children: const <TextSpan>[
                  TextSpan(text: 'You can '),
                  TextSpan(
                    text: 'only choose 1 SKILL per cycle',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ImprovementButton(
              text: "Memory",
              width: size.width * 0.8,
              route: const Memory(initialTest: true),
              imagePath: "assets/temp_background.png",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Attention",
              width: size.width,
              route: const FirstAttentionExercise(),
              imagePath: "assets/temp_background.png",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Linguistic",
              width: size.width,
              route: const FirstLinguisticExercise(),
              imagePath: "assets/temp_background.png",
            ),
            const Spacer(),
            ImprovementButton(
              text: "Logical Thinking",
              width: size.width,
              route: const FirstAttentionExercise(),
              imagePath: "assets/temp_background.png",
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
