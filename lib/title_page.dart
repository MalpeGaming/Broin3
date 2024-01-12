import 'package:flutter/material.dart';
import 'language_level_selection.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'app_bar.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: appBar(context, "title"),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: size.width / 10,
              right: size.width / 10,
              top: size.height / 8,
              bottom: size.height / 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "IMPROVE YOUR",
                style: TextStyle(
                    fontSize: size.width / 10,
                    fontWeight: FontWeight.w500,
                    height: 1),
                textAlign: TextAlign.center,
              ),
              /*AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'BRAIN',
                    textStyle: TextStyle(
                      fontSize: size.width / 5,
                      fontWeight: FontWeight.w500,
                    ),
                    speed: const Duration(milliseconds: 500),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 5000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),*/
              SizedBox(
                height: size.height / 8,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: size.height / 10,
                    fontFamily: 'Horizon',
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('BRAIN'),
                      RotateAnimatedText('MIND'),
                      RotateAnimatedText('BODY'),
                    ],
                    totalRepeatCount: 4000000,
                  ),
                ),
              ),
              SizedBox(height: 0.01 * size.height),
              Text(
                "IN 30 DAYS!",
                style: TextStyle(fontSize: size.width / 16),
              ),
              SizedBox(height: 0.05 * size.height),
              Container(
                margin: EdgeInsets.all(size.width / 14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withAlpha(60),
                      blurRadius: 80.0,
                      spreadRadius: 20.0,
                      offset: const Offset(
                        6.0,
                        6.0,
                      ),
                    ),
                  ],
                ),
                child: Image.asset('assets/brain_img.png'),
              ),
              //SizedBox(height: size.height / 50),
              const Spacer(),
              SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.75,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguageLevelSelection(
                          widget.title,
                        ),
                      ),
                    );
                  },
                  tooltip: 'Smart decision',
                  label: Text(
                    "Test Yourself!",
                    style: TextStyle(
                        fontSize: size.width / 16, color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  hoverColor: Theme.of(context).colorScheme.secondary,
                  autofocus: true,
                  heroTag: "next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
