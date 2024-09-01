import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import 'package:brain_train_app/investing/lesson16/main.dart';
import 'package:brain_train_app/app_bar.dart';

class Lesson15 extends StatefulWidget {
  const Lesson15({super.key});

  @override
  State<Lesson15> createState() => _Lesson15();
}

class _Lesson15 extends State<Lesson15> {
  int selectedOption = -1;
  DateTime beginTime = DateTime.now();

  @override
  void initState() {
    setState(() {
      beginTime = DateTime.now();
    });
    super.initState();
  }

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

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: appBar(context, ""),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              bottom: size.height / 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lesson 15",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Practical Analysis of Bonds",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                createDivider(context),
                zoomImage(context, "assets/investing/lesson15/1.png"),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 4,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 5,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 6,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 7,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 8,
                ),
                createDivider(context),
                buildQuizScreen(
                  questionNumber: 9,
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
                          if (usersAnswers[i] ==
                              questions[i]["correctAnswer"]) {
                            score++;
                          }
                        }

                        saveResult(15, score);
                        saveResult(10015, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              15,
                              "Practical Analysis of Bonds",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson16(),
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
      ),
    );
  }
}
