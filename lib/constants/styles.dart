import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ButtonStyle ButtonStyle1(double width, {bool? reverse}) {
  return ButtonStyle(
      minimumSize: MaterialStateProperty.all<Size>(Size(width, 43)),
      foregroundColor: MaterialStateProperty.all<Color>(reverse == null ? Colors.white : Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(reverse != null ? Colors.white : Colors.black),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black, width: 1),
      )));
}

// ButtonStyle ButtonStyle1(Size size) {
//   return ElevatedButton.styleFrom(
//     foregroundColor: Colors.white,
//     minimumSize: Size(size.width * 0.8, 43),
//     backgroundColor: Colors.black,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//       side: const BorderSide(color: Colors.black, width: 1),
//     ),
//   );
// }
