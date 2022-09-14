import 'package:flutter/material.dart';

class CustomWidget {
  Widget mybutton(Size size, String text, Function()? onPressed) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: Size(size.width * 0.8, 43),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  Text myText(String text,
      {double size = 13,
      Color color = Colors.black,
      bool isbols = false,
      bool isUnderlined = false}) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: TextStyle(
          fontWeight: isbols ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration:
              isUnderlined ? TextDecoration.underline : TextDecoration.none,
          fontSize: size),
    );
  }
}
