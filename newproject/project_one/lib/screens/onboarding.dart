import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingPages = [
    {
      "title": "Trusted Industrial Professionals",
      "description":
          "Connect with vetted and experienced service providers you can rely on.",
      "image": "assets/images/onboarding1.jpg",
    },
    {
      "title": "Access Expertise On Demand",
      "description":
          " Find the right specialists for any job, from maintenance and repairs to complex installations and upgrades.",
      "image": "assets/images/onboarding2.jpg",
    },
    {
      "title": "Your Partner in Industrial Success",
      "description":
          "We're here to support your operations with reliable and efficient service solutions.",
      "image": "assets/images/onboarding3.jpg"
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.4,
                          width: width * 0.8,
                          child: Image.asset(
                            onboardingPages[index]['image'],
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          onboardingPages[index]['title'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: orange,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingPages[index]['description'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Page Indicator (Dots)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: _currentPage == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? orange : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        // Navigate to Login Screen on last step
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const LoginScreen(),
                        //   ),
                        // );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == onboardingPages.length - 1
                          ? "Get Started"
                          : "Next",
                      //   style:
                      //       TextStyle(color: orange, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
