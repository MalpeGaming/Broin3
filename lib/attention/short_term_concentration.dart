import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../show_score.dart';
import 'long_term_concentration.dart';
import '/progress_screen.dart';

class ShortTermConcentration extends StatefulWidget {
  const ShortTermConcentration({super.key, this.initialTest = false});

  final bool initialTest;

  @override
  State<ShortTermConcentration> createState() => _ShortTermConcentration();
}

class _ShortTermConcentration extends State<ShortTermConcentration> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
        enableKeyboard: false,
      ),
    );

    _controller.loadVideo("https://www.youtube.com/watch?v=aCtjqGRQAaU");
  }

  double score = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "ATTENTION",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    "Exercise 1 - Short Term Concentration",
                    style: TextStyle(fontSize: size.width / 20),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Follow the instructions in the video.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  YoutubePlayer(
                    controller: _controller,
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Write yout score BELOW.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: size.width / 24),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            String text = newValue.text;
                            if (text.isEmpty || int.parse(text) <= 10) {
                              score = double.parse(text);
                              return newValue;
                            }
                            return oldValue;
                          }),
                        ],
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _controller.close();
                      Navigator.pop(context);

                      if (widget.initialTest) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowScore(
                              title: "ATTENTION",
                              description:
                                  "Exercise 1 - Short Term Concentration",
                              exercise: 1,
                              yourScore: score,
                              maximum: 10,
                              page: const LongTermConcentration(
                                initialTest: true,
                              ),
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProgressScreen(
                              name: "short_term_concentration",
                              score: score,
                            ),
                          ),
                        );
                      }
                    },
                    tooltip: 'Continue',
                    label: Text(
                      "Continue",
                      style: TextStyle(fontSize: size.width / 16),
                    ),
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      size: size.width / 16,
                    ),
                    backgroundColor: Colors.blue[400],
                    hoverColor: Colors.blue[900],
                    autofocus: true,
                    heroTag: "continue",
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
