import 'package:flutter/material.dart';

class ToggleButtonLabel extends StatelessWidget {
  final String text;

  ToggleButtonLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWideScreen
            ? MediaQuery.of(context).size.width / 50
            : MediaQuery.of(context).size.width / 35,
      ),
      child: Text(
        text,
        style: TextStyle(
          // Define your text style here
          fontSize: isWideScreen ? 16.0 : 12.0, // Customize the font size
          fontWeight: FontWeight.normal, // Customize the font weight
          // You can add more styling as needed
        ),
      ),
    );
  }
}
