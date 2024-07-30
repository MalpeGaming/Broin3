import 'meditation_videos.dart';
import 'package:flutter/material.dart';
import '/app_bar.dart';

class MinuteListItem extends StatefulWidget {
  final int videoTimeIndex;

  const MinuteListItem({super.key, required this.videoTimeIndex});

  @override
  _MinuteListItemState createState() => _MinuteListItemState();
}

class _MinuteListItemState extends State<MinuteListItem> {
  List<int> minutes = [1, 2, 3, 5];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int videoTime = minutes[widget.videoTimeIndex];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MeditationVideos(
                videoTimeIndex: widget.videoTimeIndex,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: size.height * 0.06,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      '$videoTime min',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MeditationMinutes extends StatefulWidget {
  const MeditationMinutes({super.key});

  @override
  State<MeditationMinutes> createState() => _MeditationMinutes();
}

class _MeditationMinutes extends State<MeditationMinutes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 50,
            bottom: size.height / 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "MEDITATION",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'STEP BY STEP',
                      style: TextStyle(fontSize: size.width / 20),
                    ),
                  ),
                  SizedBox(height: 0.04 * size.height),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: size.width / 18,
                          height: 1.2,
                        ),
                        children: const [
                          TextSpan(
                            text: 'How much ',
                          ),
                          TextSpan(
                            text: 'time',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' would you like to meditate for ?'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  SizedBox(
                    height: size.height / 1.825,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            children: List.generate(4, (index) {
                              return MinuteListItem(
                                videoTimeIndex: index,
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: size.height / 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
