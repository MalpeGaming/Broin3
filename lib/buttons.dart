import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'language_level_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

void nuthin() {}

class StartButton extends StatefulWidget {
  final String text;
  final String tooltip;
  final double width;

  const StartButton({
    super.key,
    required this.text,
    required this.width,
    required this.tooltip,
  });

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool hovered = false;
  late SharedPreferences prefs;
  DateTime now = DateTime.now();
  Future<void> initMemory() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('plan');
    prefs.setString(
      'beginning_date',
      DateTime(now.year, now.month, now.day).toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        initMemory();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanguageLevelSelection(
              widget.text,
            ),
          ),
        );
      },
      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: hovered
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Tooltip(
          message: widget.tooltip,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.width / 14,
                color: const Color.fromARGB(255, 224, 246, 255),
              ),
            ),
          ),
        ),
      ).animate(target: hovered ? 1 : 0).scaleXY(end: 1.1),
    );
  }
}

class RedirectButton extends StatefulWidget {
  final String text;
  final String? tooltip;
  final double width;
  final Widget? route;
  final bool requirement;
  final void Function() onClick;
  final bool clearAllWindows;

  const RedirectButton({
    super.key,
    required this.text,
    required this.width,
    this.tooltip,
    this.route,
    this.requirement = true,
    this.onClick = nuthin,
    this.clearAllWindows = false,
  });

  @override
  State<RedirectButton> createState() => _RedirectButtonState();
}

class _RedirectButtonState extends State<RedirectButton> {
  bool hovered = false;
  bool accesible = true;
  bool toRed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        if (widget.requirement) {
          setState(() {
            hovered = value;
          });
        }
      },
      onTap: () {
        if (widget.requirement) {
          //
          widget.onClick();
          //
          if (widget.route != null) {
            //Navigator.pop(context);
            if (widget.clearAllWindows) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => widget.route!),
                (Route<dynamic> route) => false,
              );
            } else {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget.route!,
                ),
              );
            }
          }
        } else if (!toRed) {
          setState(() {
            accesible = false;
            toRed = true;
          });
          Future.delayed(const Duration(milliseconds: 250), () {
            setState(() {
              accesible = true;
            });
          });

          Future.delayed(const Duration(milliseconds: 650), () {
            setState(() {
              toRed = false;
            });
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: toRed
              ? Theme.of(context).colorScheme.error
              : hovered
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: widget.tooltip != null
            ? Tooltip(
                message: widget.tooltip!,
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: widget.width / 16),
                  ),
                ),
              )
            : Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: widget.width / 16,
                    color: Colors.white,
                  ),
                ),
              ),
      )
          .animate(target: hovered ? 1 : 0)
          .scaleXY(end: 1.05)
          .animate(target: accesible ? 0 : 1)
          .shake(
            hz: 4,
            rotation: 0.15,
            duration: const Duration(milliseconds: 250),
          )
          .scaleXY(end: 1.2),
    );
  }
}

class ImprovementButton extends StatefulWidget {
  final String text;
  final double width;
  final Widget route;
  final String img;
  final String name;

  const ImprovementButton({
    super.key,
    required this.text,
    required this.width,
    required this.route,
    required this.img,
    required this.name,
  });

  @override
  State<ImprovementButton> createState() => _ImprovementButtonState();
}

class _ImprovementButtonState extends State<ImprovementButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late SharedPreferences prefs;
    //initMemory();
    return SizedBox(
      //flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.width / 6,
            width: size.width / 6,
            child: Image.asset(
              "assets/improvement_selection/${widget.img}",
              height: size.width / 6,
            ),
          ),
          SizedBox(
            width: size.width / 40,
          ),
          SizedBox(
            height: size.height / 15,
            width: size.width * 0.6,
            child: InkWell(
              onHover: (value) {
                setState(() {
                  hovered = value;
                });
              },
              onTap: () {
                Future<void> initMemory() async {
                  prefs = await SharedPreferences.getInstance();
                  prefs.setString(
                    'skill',
                    widget.name,
                  );
                }

                initMemory();

                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: widget.route,
                    reverseDuration: const Duration(milliseconds: 100),
                    opaque: true,
                  ),
                );
              },
              child: Container(
                width: widget.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimary,
                    ],
                    tileMode: TileMode.decal,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: widget.width / 16,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
