import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import '../menu.dart';
import 'package:brain_train_app/investing/lesson26/main.dart';

class Lesson25 extends StatefulWidget {
  const Lesson25({super.key});

  @override
  State<Lesson25> createState() => _Lesson25();
}

class _Lesson25 extends State<Lesson25> {
  int selectedOption = -1;

  Widget buildQuizScreen({
    required int questionNumber,
    String? image,
    Widget? imageWidget,
  }) {
    List<String> answers = questions[questionNumber]["answers"] as List<String>;
    ListTile createListTitle(int val, String text, Size size) {
      return ListTile(
        dense: true,
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: (usersAnswers[questionNumber] == -1)
            ? Radio<int>(
                value: val,
                groupValue: usersAnswers[questionNumber],
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    usersAnswers[questionNumber] = value!;
                  });
                },
              )
            : createDot(
                context,
                usersAnswers[questionNumber],
                questions[questionNumber]["correctAnswer"]!,
                val,
              ),
      );
    }

    return createExercise(
      context,
      questionNumber,
      questions[questionNumber]["question"] as String,
      answers,
      image,
      imageWidget,
      createListTitle,
      (questions[questionNumber]["explanation"] != null &&
              usersAnswers[questionNumber] != -1)
          ? questions[questionNumber]["explanation"] as String
          : null,
    );
  }

  List<int> usersAnswers = List<int>.filled(questions.length, -1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime beginTime = DateTime.now();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 15,
            bottom: size.height / 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lesson 25",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Technical Analysis Exercises",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 0,
                image: "assets/investing/lesson25/ex0.png",
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 1,
                image: "assets/investing/lesson25/ex1.png",
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 2,
                image: "assets/investing/lesson25/ex2.png",
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 3,
                image: "assets/investing/lesson25/ex3.png",
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 4,
                image: "assets/investing/lesson25/ex4.png",
              ),
              createDivider(context),
              buildQuizScreen(
                questionNumber: 5,
                image: "assets/investing/lesson25/ex5.png",
              ),
              SizedBox(height: size.height / 10),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    //route: const Lesson2(),
                    onClick: () {
                      int score = 0;
                      for (int i = 0; i < usersAnswers.length; i++) {
                        if (usersAnswers[i] == questions[i]["correctAnswer"]) {
                          score++;
                        }
                      }
                      print("wynik:");
                      print(score);
                      saveResult(25, score);
                      saveResult(10025, questions.length);

                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Success(
                            25,
                            "Why Should You Invest? continued...",
                            DateTime.now().difference(beginTime).inMinutes,
                            score,
                            questions.length,
                            const Lesson26(),
                          ),
                        ),
                      );
                    },
                    text: 'Continue',
                    width: size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
