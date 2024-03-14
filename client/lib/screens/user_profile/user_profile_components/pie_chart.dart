import 'package:client/controllers/user_profile_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var userProfileController = Get.find<UserProfileController>();
    return GetBuilder<UserProfileController>(builder: (controller){
      return SizedBox(
        height: 280,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 3,
                centerSpaceRadius: 80,
                sections: userProfileController.pieChartData,
              ),
            ),
            Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Progress',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ))
          ],
        ),
      );
    });


  }
}