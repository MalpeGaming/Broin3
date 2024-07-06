import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../menu.dart';
import '../helper_fn.dart';
import 'questions.dart';

class Lesson12 extends StatefulWidget {
  const Lesson12({super.key});

  @override
  State<Lesson12> createState() => _Lesson12();
}

class _Lesson12 extends State<Lesson12> {
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
                "Lesson 12",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "How to choose a bond ?",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              //SizedBox(height: size.height / 60),
              createDivider(context),
              Text(
                "Step 1: Define Your Investment Goals",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Determine why you want to invest in bonds. Are you looking for stable income, diversification, or to preserve capital? Your investment goals will guide your bond selection, whether it's corporate bonds for higher returns or government bonds for safety.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 0,
              ),
              createDivider(context),
              Text(
                "Step 2: Understand Bond Types and Risk Levels",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Learn about different types of bonds, such as government, corporate, municipal, and high-yield bonds. Each type carries different risks and returns. For instance, government bonds are considered safer than high-yield corporate bonds, which offer higher returns but also carry more risk.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 1,
              ),
              createDivider(context),
              Text(
                "Step 3: Analyze Bond Fundamentals",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Check the bond's credit rating, interest rate (coupon), maturity, and yield to maturity (YTM). Higher credit ratings indicate lower risk, while higher yields usually come with higher risk. Consider the maturity date to match your investment horizon.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 2,
              ),
              createDivider(context),
              Text(
                "Step 4: Evaluate Yield and Interest Rate Risk",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Evaluate the bond's current yield and yield to maturity to understand its return. Also, consider interest rate risk: when interest rates rise, bond prices typically fall, and vice versa.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 3,
              ),
              createDivider(context),
              Text(
                "Step 5: Consider Inflation Risk",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Inflation erodes the purchasing power of the interest payments and principal repayment. Inflation-linked bonds, like Treasury Inflation-Protected Securities (TIPS), help protect against inflation by adjusting payments with inflation.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 4,
              ),
              createDivider(context),
              Text(
                "Step 6: Assess Tax Implications",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Understand the tax treatment of bond income. Municipal bonds often provide tax-free interest, which is beneficial for investors in higher tax brackets. Compare this to the after-tax return of taxable bonds.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 5,
              ),
              createDivider(context),
              Text(
                "Step 7: Check for Callable Bonds",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Callable bonds can be redeemed by the issuer before maturity. This feature allows issuers to repay bonds early if interest rates drop. Investors may lose potential interest payments, so consider if you want a callable bond.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 6,
              ),
              createDivider(context),
              Text(
                "Step 8: Diversify Your Bond Portfolio",
                style: TextStyle(
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Invest in different types of bonds across various sectors and maturities to spread risk. A diversified bond portfolio can provide stability and consistent returns, even if some bonds perform poorly.",
                style: TextStyle(
                  fontSize: size.height / 50,
                ),
              ),
              SizedBox(height: size.height / 20),
              buildQuizScreen(
                questionNumber: 7,
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
                      saveResult(12, score);
                      saveResult(10012, questions.length);

                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvestingMenu(),
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
