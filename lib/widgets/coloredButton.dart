import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final text;
  final textalign;
  final icon;
  const ColoredButton({
    super.key,
    required this.text,
    this.textalign,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(top: 15, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$text',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          if (icon != null) // Conditionally include the arrow icon if provided
            icon
        ],
      ),
    );
  }
}
