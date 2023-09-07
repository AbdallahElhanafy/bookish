

import 'package:ebook_app/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String Action_Button;
  final TextColor;
final double FontSize;
  final BackColor;
  final double Border_Width;

  const MyButton({
    super.key,
   required this.FontSize,
    required this.onTap,
    required this.Action_Button,
    required this.BackColor,
    required this.Border_Width,
    required this.TextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        //padding: const EdgeInsets.all(25),
        
        decoration: BoxDecoration(
          color: BackColor,
          border: Border.all(
            color: kSecondaryColor,
            width: Border_Width,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            Action_Button,
            style: TextStyle(
              color: TextColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
