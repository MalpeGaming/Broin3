import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../helper_fn.dart';
import 'questions.dart';
import 'package:brain_train_app/investing/lesson20/main.dart';

class Lesson19 extends StatefulWidget {
  const Lesson19({super.key});

  @override
  State<Lesson19> createState() => _Lesson19();
}

class _Lesson19 extends State<Lesson19> {
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

    return PopScope(
      canPop: false,
      child: Scaffold(
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
                  "Lesson 19",
                  style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 60),
                Text(
                  "Some of the most popular ETFs",
                  style: TextStyle(
                    fontSize: size.width / 15,
                  ),
                ),
                SizedBox(height: size.height / 20),
                keyVocabulary(
                  context,
                  "SPDR S&P 500 ETF (SPY):",
                  "The SPDR S&P 500 ETF is designed to replicate the performance of the S&P 500 index, which includes 500 of the largest publicly traded companies in the United States. The fund's diversified portfolio includes stocks from various sectors, such as technology, healthcare, and finance. SPY is one of the oldest and largest ETFs, often used as a core holding in many investment portfolios.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 0,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Invesco QQQ Trust (QQQ):",
                  "The Invesco QQQ Trust tracks the NASDAQ-100 index, which is composed of the 100 largest non-financial companies listed on the NASDAQ exchange. It provides concentrated exposure to the technology sector, as many of the largest technology companies like Apple, Microsoft, and Amazon are included in this index.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 1,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Vanguard Total Stock Market ETF (VTI):",
                  "The Vanguard Total Stock Market ETF seeks to track the performance of the CRSP US Total Market Index, representing nearly the entire investable U.S. stock market. It includes small-, mid-, and large-cap stocks across different sectors, offering comprehensive exposure to the U.S. equity market.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 2,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "iShares MSCI Emerging Markets ETF (EEM):",
                  "The iShares MSCI Emerging Markets ETF aims to capture the performance of emerging market economies by tracking the MSCI Emerging Markets Index. This ETF includes stocks from countries like China, India, and Brazil, offering investors exposure to fast-growing economies outside the developed markets.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 3,
                ),
                createDivider(context),
                keyVocabulary(
                  context,
                  "Vanguard FTSE Developed Markets ETF (VEA):",
                  "The Vanguard FTSE Developed Markets ETF provides exposure to stocks of developed economies outside the U.S., like Japan, the U.K., and Canada. By tracking the FTSE Developed All Cap ex-US Index, this ETF gives investors access to international developed markets for diversification beyond domestic equities.",
                ),
                SizedBox(height: size.height / 20),
                buildQuizScreen(
                  questionNumber: 4,
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
                        print("wynik:");
                        print(score);
                        saveResult(19, score);
                        saveResult(10019, questions.length);

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Success(
                              19,
                              "Some of the most popular ETFs",
                              DateTime.now().difference(beginTime).inMinutes,
                              score,
                              questions.length,
                              const Lesson20(),
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
