import 'package:flutter/material.dart';

class OnboardingScreensTemplate extends StatelessWidget {
  final Widget firstLine;
  final Widget secondLine;
  final String image;
  final String description;
  const OnboardingScreensTemplate({
    super.key,
    required this.image,
    required this.firstLine,
    required this.secondLine,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 49,
            ),
            firstLine,
            const SizedBox(
              height: 10,
            ),
            secondLine,
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
