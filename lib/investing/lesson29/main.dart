import 'package:flutter/material.dart';
import 'package:brain_train_app/buttons.dart';
import '../helper_fn.dart';
import '../menu.dart';
import 'package:url_launcher/url_launcher.dart';

class Lesson29 extends StatefulWidget {
  const Lesson29({super.key});

  @override
  State<Lesson29> createState() => _Lesson29();
}

class _Lesson29 extends State<Lesson29> {
  Widget hyperlinkPoint(BuildContext context, String text, String url) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 0.05 * size.width,
          ),
          child: Icon(
            Icons.circle,
            size: 0.02 * size.width,
          ),
        ),
        SizedBox(
          width: 0.7 * size.width,
          child: InkWell(
            child: Text(
              text,
              style: TextStyle(
                //   color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 0.02 * size.height,
                fontWeight: FontWeight.w500,
                //  fontStyle: FontStyle.italic,
              ),
            ),
            onTap: () => launchUrl(
              Uri.parse(url),
            ),
          ),
        ),
      ],
    );
  }

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
                "Lesson 29",
                style: TextStyle(
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 60),
              Text(
                "Fundamental Analysis",
                style: TextStyle(
                  fontSize: size.width / 15,
                ),
              ),
              createDivider(context),
              //SizedBox(height: size.height / 20),
              Text(
                "When looking for a crypto coin I recommend you go over the following questions and answer each one.",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "www.coindesk.com → news",
                "https://www.coindesk.com",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "bitcointalk.org",
                "https://bitcointalk.org",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "cointelegraph.com → news",
                "https://cointelegraph.com",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "coinmarketcal.com/ → all important dates",
                "https://coinmarketcal.com/en/",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "messari.io",
                "https://messari.io",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "Twitter",
                "https://x.com",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "Reddit",
                "https://www.reddit.com/",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "Telegram",
                "https://telegram.org/",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "steemit",
                "https://steemit.com/",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "cryptomiso",
                "https://www.cryptomiso.com/",
              ),
              SizedBox(height: size.height / 80),

              hyperlinkPoint(
                context,
                "YouTube → AltcoinDaily",
                "https://www.youtube.com/c/altcoindaily",
              ),
              SizedBox(height: size.height / 40),

              Text(
                "I recommend that now you do your own research, and explore the websites and platforms provided by me : ).",
                style: TextStyle(
                  fontSize: 0.02 * size.height,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height / 20),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    onClick: () {
                      print("wynik:");
                      print(1);
                      saveResult(29, 1);
                      saveResult(10029, 1);

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
