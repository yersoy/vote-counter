import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberWidget extends StatelessWidget {
  final String text;
  final int count;
  final bool dot;
  const NumberWidget({super.key, this.text = "", this.count = 0, this.dot = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count.toString() + (dot ? ":" : "").toString(),
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
