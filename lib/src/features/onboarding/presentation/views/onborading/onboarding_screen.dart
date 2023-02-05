import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate/src/features/onboarding/presentation/views/onborading/widgets/onborading_screen1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/constants/app_const.dart';
import '../../../../../core/widgets/button.dart';
import 'widgets/onborading_screen2.dart';
import 'widgets/onborading_screen3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    void skip() {
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    void next() {
      if (index == 2) {
        context.go('/auth');
      } else {
        pageController.animateToPage(
          pageController.page!.round() + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    }

    void back() {
      pageController.animateToPage(
        pageController.page!.round() - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Appconst.logoPath,
                width: 55,
                height: 55,
              ),
              SizedBox(
                width: 85,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    skip();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  PageOne(),
                  PageTwo(),
                  PageThree(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmoothPageIndicator(
                        effect: const ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Colors.white,
                          dotHeight: 10,
                          dotWidth: 10,
                          expansionFactor: 7,
                          spacing: 4,
                        ),
                        controller: pageController,
                        count: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              opacity: index != 0 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 250),
                              child: GestureDetector(
                                onTap: () => back(),
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Button(
                              text: 'Next',
                              width: 200,
                              onTap: () {
                                next();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
