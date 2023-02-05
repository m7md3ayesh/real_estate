import 'package:flutter/material.dart';

import 'onboarding_screens_template.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreensTemplate(
      firstLine: Text(
        'Find your',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
      secondLine: Text(
        'Dream House',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
      image: 'assets/images/onboarding3.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    );
  }
}
