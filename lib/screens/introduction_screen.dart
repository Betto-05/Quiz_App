import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz/screens/main_screen.dart';

class IntroductionScreenPage extends StatelessWidget {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  String? userName;

  IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: introKey, // Add the key here
        pages: [
          PageViewModel(
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Image.asset("assets/3.png"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Welcome to Cognify",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Sharpen your mind with engaging quizzes!\nChallenge yourself, track progress, and learn smarter.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            bodyWidget: const Center(),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Image.asset("assets/4.png", scale: 2.8),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Why Cognify?",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Boost your knowledge across various subjects\nChallenge yourself with timed quizzes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            bodyWidget: const Center(),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Image.asset("assets/2.png"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Your Learning, Your Way",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Pick your favorite subjects and difficulty level. Cognify adapts to your learning style!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            bodyWidget: const Center(),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Text(
                  "Let's Get Started",
                  style: TextStyle(color: Colors.blue.shade900, fontSize: 32),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TextField(
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Enter your name and step into a world of endless learning and excitement!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            bodyWidget: const Center(),
            decoration: pageDecoration(),
          ),
        ],
        onDone: () {
          if (userName == null || userName!.trim().isEmpty) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(Icons.warning, size: 120, color: Colors.red),
                title: const Text(
                  "You have to write your name",
                  style: TextStyle(fontSize: 15),
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          }
        },
        onSkip: () {
          introKey.currentState?.animateScroll(3); // Navigate to the last page
        },
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(color: Colors.blue.shade900),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: Colors.blue.shade900,
        ),
        done: Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size(10, 10),
          color: Colors.white,
          activeColor: Colors.blue.shade900,
          activeSize: const Size(22, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }

  PageDecoration pageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade900,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.blue.shade900,
      ),
      imagePadding: const EdgeInsets.all(20),
    );
  }
}
