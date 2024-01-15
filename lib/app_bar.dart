import 'package:flutter/material.dart';
import 'main.dart';

AppBar appBar(BuildContext context, String title) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.background,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: size.width / 16),
        ),
        ElevatedButton(
          onPressed: () {
            MyApp.of(context).switchTheme();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.background,
            foregroundColor: Colors.yellow,
          ),
          child: const Icon(
            Icons.wb_sunny_outlined,
          ),
        ),
      ],
    ),
  );
}
