import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewModels extends StatelessWidget {
  PageViewModels({super.key, required this.imageUrl,required this.text});
  String imageUrl;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset('assets/$imageUrl'),
        ),
        const SizedBox(height: 80,),
        Padding(
          padding: const EdgeInsets.only(left:50,right: 50),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),  
        )
      ],
    );
  }
}
