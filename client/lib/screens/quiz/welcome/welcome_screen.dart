import 'package:client/util/constants.dart';
import 'package:client/screens/quiz/question_screen.dart';
import 'package:client/util/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool pageStatus = false;

  @override
  initState() {
    setPageStatus();
    super.initState();
  }

  setPageStatus() async {
    final status = await LocalStorage().getQuizPageStatus();
    setState(() {
      pageStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !pageStatus
        ? Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    'animations/Animation - 1711270869468.json',
                    height: 350,
                    reverse: true,
                    repeat: true,
                    animate: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'No Scheduled Quiz Available',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Center(
                      child: Column(
                        children: [
                          const Spacer(flex: 2),
                          Lottie.asset(
                            'animations/Animation - 1710413869166.json',
                            height: 380,
                            reverse: true,
                            repeat: true,
                            animate: true,
                          ),
                          const Spacer(), //2/6
                          Text(
                            textAlign: TextAlign.center,
                            "Are you ready for the quiz?",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: const Color.fromARGB(255, 6, 6, 6),
                                    fontWeight: FontWeight.bold),
                          ),
                          const Spacer(), // 1/6
                          InkWell(
                            onTap: () {
                              if (pageStatus) Get.to(() => const QuizScreen());
                            },
                            child: Container(
                              width: 300,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.all(kDefaultPadding * 0.75),
                              // 15
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withOpacity(.8),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
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
                          const Spacer(flex: 2), // it will take 2/6 spaces
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
