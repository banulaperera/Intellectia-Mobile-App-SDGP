import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/constants.dart';
import 'package:client/screens/login_page.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  CarouselController buttonCarouselController = CarouselController();

  List lottieFiles = [
    {
      "image": "animations/Animation - 1710912694104.json",
      "title": "Note - Taking",
      "subtitle": "Discover the power to learn at your own\n pace by storing all your study material in\n this amazing application."
    },
    {
      "image": "animations/Animation - 1710912852563.json",
      "title": "Quizzes",
      "subtitle": "Try an app to create quizzes using your\n own materials or external resources.\n Get scheduled quizzes with instant\n feedback. Start your journey of\n continuous learning today!"
    },
    {
      "image": "animations/Animation - 1710913414361.json",
      "title": "Modularization",
      "subtitle": "Create separate app modules for each\n learning module to enhance the overall\n learning experience."
    },
    {
      "image": "animations/Animation - 1710916877148.json",
      "title": "Point Reward System",
      "subtitle": "Track your progress and achieve your goals\n with this personalized app that offers\n tailored support and guidance."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: lottieFiles
                  .map(
                    (gObj) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            kPrimaryColor,
                            kPrimaryColor.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.1,
                          horizontal: 25),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Lottie.asset(
                              gObj["image"].toString(),
                              height: MediaQuery.of(context).size.width * 0.6,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              gObj["title"].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: 1,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              gObj["subtitle"].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.75,
                aspectRatio: 0.74,
                initialPage: 0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                const Text(
                  "What you can do with Intellectia?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "It will help you to know more about us and\n our services.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => LoginPage(), transition: Transition.fadeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 90),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                              0,
                              4,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
