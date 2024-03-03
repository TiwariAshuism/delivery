import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .scaffoldBackgroundColor, // Use the background color from the current theme
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white, // Border color depends on the theme
              width: 0.2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color, // Text color from the current theme
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.restore_from_trash, // Replace with your desired icon
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white, // Icon color from the current theme
              ),
              // Add spacing between icon and text
            ],
          ),
        ),
      ],
    );
  }
}
