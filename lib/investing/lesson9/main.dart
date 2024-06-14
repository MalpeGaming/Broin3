import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../lesson10/main.dart';
import '../helper_fn.dart';
import 'questions.dart';

class Lesson9 extends StatefulWidget {
  const Lesson9({super.key});

  @override
  State<Lesson9> createState() => _Lesson9();
}

class _Lesson9 extends State<Lesson9> {
  int selectedOption = -1;

  Widget buildQuizScreen({
    required int questionNumber,
    Widget? image,
  }) {
    List<String> answers = questions[questionNumber]["answers"] as List<String>;
    Size size = MediaQuery.of(context).size;
    ListTile createListTitle(int val, String text, Size size) {
      return ListTile(
        dense: true,
        title: Text(
          text,
          style: TextStyle(fontSize: 0.02 * size.height),
        ),
        leading: Radio<int>(
          value: val,
          groupValue: selectedOption,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exercise ${questionNumber + 1}.",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 0.02 * size.height,
          ),
        ),
        Text(
          questions[questionNumber]["question"] as String,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
        ),
        if (image != null) image,
        SizedBox(height: MediaQuery.of(context).size.height / 70),
        Column(
          children: List.generate(answers.length, (index) {
            return Container(
              child: createListTitle(index, answers[index], size),
            );
          }),
        ),
      ],
    );
  }

  List<int> usersAnswers = List<int>.filled(4, -1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                "Lesson 9",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Value / Growth Stocks",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Growth Stocks:",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Growth stocks belong to companies expected to grow rapidly in the future. These companies reinvest profits into expansion rather than paying high dividends, aiming for substantial future returns. Their stock prices often reflect high investor expectations. Growth stocks are rather high-risk, and thus are good for investors that are young and don’t have many responsibilities (like family).",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 40),
              keyVocabulary(
                context,
                "Examples:",
                "Technology companies like Amazon and Tesla are considered growth stocks due to their focus on innovation and expansion.",
              ),
              SizedBox(height: size.height / 60),

              Text(
                "Expected Financial Metrics:",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Container(
                margin: EdgeInsets.only(left: size.width / 20),
                child: Column(
                  children: [
                    keyVocabulary(
                      context,
                      "P/E Ratio:",
                      "Typically high, often above 20, indicating high growth expectations.",
                    ),
                    keyVocabulary(
                      context,
                      "P/B Ratio:",
                      "Higher than 3, reflecting investor confidence in future growth.",
                    ),
                    keyVocabulary(
                      context,
                      "Dividend Yield:",
                      "Usually low or zero, as profits are reinvested for growth.",
                    ),
                    keyVocabulary(
                      context,
                      "Cash Per Share:",
                      "Varies, as growth stocks may reinvest cash rather than holding it.",
                    ),
                    keyVocabulary(
                      context,
                      "ROA:",
                      "Can be low initially but expected to grow as the company matures.",
                    ),
                    keyVocabulary(
                      context,
                      "ROE:",
                      "Moderate to high, reflecting effective use of investor funds.",
                    ),
                    keyVocabulary(
                      context,
                      "Quarterly Earnings Growth:",
                      "High, often exceeding 20%, showing rapid expansion.",
                    ),
                    keyVocabulary(
                      context,
                      "Beta:",
                      "High, often above 1.5, indicating volatility due to growth expectations.",
                    ),
                    keyVocabulary(
                      context,
                      "Debt/Equity Ratio:",
                      "Varies, but often moderate, reflecting investments in growth.",
                    ),
                  ],
                ),
              ),
              createDivider(context),

              //SizedBox(height: size.height / 60),
              Text(
                "Value Stocks:",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Value stocks are considered undervalued by the market and trade at a lower price relative to their fundamentals. These companies are usually well-established and pay dividends, offering steady returns - and thus are a good investment for literally everyone, regardless the age.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 40),
              keyVocabulary(
                context,
                "Examples:",
                "Companies like Coca-Cola and Procter & Gamble are considered value stocks, as they have stable earnings and often pay dividends.",
              ),
              SizedBox(height: size.height / 60),

              Text(
                "Expected Financial Metrics:",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Container(
                margin: EdgeInsets.only(left: size.width / 20),
                child: Column(
                  children: [
                    keyVocabulary(
                      context,
                      "P/E Ratio:",
                      "Lower than 20, indicating undervaluation relative to earnings.",
                    ),
                    keyVocabulary(
                      context,
                      "P/B Ratio:",
                      "Lower than 3, reflecting undervaluation relative to book value.",
                    ),
                    keyVocabulary(
                      context,
                      "Dividend Yield:",
                      "Moderate to high, often above 2%, as they distribute profits.",
                    ),
                    keyVocabulary(
                      context,
                      "Cash Per Share:",
                      "Stable, as they tend to retain cash for dividends and operations.",
                    ),
                    keyVocabulary(
                      context,
                      "ROA:",
                      "Moderate, indicating efficient use of assets.",
                    ),
                    keyVocabulary(
                      context,
                      "ROE:",
                      "- Moderate, showing steady profitability.",
                    ),
                    keyVocabulary(
                      context,
                      "Quarterly Earnings Growth:",
                      "Moderate, reflecting consistent earnings.",
                    ),
                    keyVocabulary(
                      context,
                      "Beta:",
                      "Low to moderate, often below 1.2, indicating lower volatility.",
                    ),
                    keyVocabulary(
                      context,
                      "Debt/Equity Ratio:",
                      "Usually low, indicating conservative financial management.",
                    ),
                  ],
                ),
              ),
              createDivider(context),
              Column(
                children: List.generate(questions.length, (index) {
                  return Container(
                      margin: const EdgeInsets.all(5),
                      child: buildQuizScreen(questionNumber: index),);
                }),
              ),
              SizedBox(height: size.height / 20),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: const Lesson10(),
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
