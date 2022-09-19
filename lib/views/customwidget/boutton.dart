import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CustomWidget {
  Widget mybutton(Size size, String text, Function()? onPressed, {bool withLoading = false , Widget child = const Text("")}) {
    return ElevatedButton(
        style: ButtonStyle1(size.width * 0.8),
        onPressed: onPressed ,
        child: !withLoading ? Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ) : child ,
    );
  }

  Text myText(String text, {double size = 13, Color color = Colors.black, bool isbols = false, bool isUnderlined = false}) {
    return Text(
      text,
      // overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: TextStyle(fontWeight: isbols ? FontWeight.bold : FontWeight.normal, color: color, decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none, fontSize: size),
    );
  }
}
