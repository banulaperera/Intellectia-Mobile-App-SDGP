import 'package:client/screens/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
import 'package:client/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2), //2/6
                  Text(
                    textAlign: TextAlign.center,
                    "Are you ready for the quiz?",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color.fromARGB(255, 6, 6, 6),
                        fontWeight: FontWeight.bold),
                  ),
                  // const Text("Enter your information below"),
                  // const Spacer(), // 1/6
                  // const TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Color.fromARGB(255, 249, 249, 249),
                  //     hintText: "Full Name",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //   ),
                  // ),
                  const Spacer(), // 1/6
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Let's Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: kBackgroundColor),
                      ),
                    ),
                  ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const QuizScreen()),
                  // );
                  //   },
                  //   backgroundColor: Colors.blue,
                  //   foregroundColor: Colors.black,
                  //   hoverColor: Colors.blueGrey,
                  //   child: const Text('Start'),
                  // ),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
