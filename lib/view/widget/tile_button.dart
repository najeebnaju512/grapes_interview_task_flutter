import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton(
      {super.key, required this.text, this.buttonColor = Colors.white});
  final String text;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }
}
