import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowinsurance/constants/images.dart';
import 'package:flowinsurance/constants/strings.dart';
import 'package:flowinsurance/views/accueil/accueil.dart';
import 'package:flowinsurance/views/diagnostic/debut_diagnostic.dart';
import 'package:flowinsurance/views/onboarding_screen/components/intermediaire.dart';
import 'package:flowinsurance/views/onboarding_screen/components/pageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            PageViewModels(
                imageUrl: ImageData.group1, text: StringData.groupe1),
            PageViewModels(
                imageUrl: ImageData.group4, text: StringData.groupe2),
            PageViewModels(
                imageUrl: ImageData.group6, text: StringData.groupe3),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  controller.jumpTo(0);
                },
                child:
                    const Text("Skip", style: TextStyle(color: Colors.black))),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  spacing: 16,
                  dotColor: Color.fromARGB(255, 154, 203, 243),
                  activeDotColor: Colors.blue,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            TextButton(
                onPressed: () {
                  (!isLastPage)
                      ? controller.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut)
                      :  
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Intermediaire()));
                },
                child: Text(
                  (!isLastPage) ? "Next" : "Done",
                )),
          ],
        ),
      ),
    );
  }
}
