import 'package:client/controllers/user_profile_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class BarGraph extends StatelessWidget {
  BarGraph({super.key});

  final userProfileController = Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      builder: (controller) {
        return BarChart(
          BarChartData(
            maxY: 10000,
            minY: 0,
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottomTiles),
              ),
            ),
            barGroups: userProfileController.barData.barData
                .map(
                  (e) => BarChartGroupData(
                    x: e.x,
                    barRods: [
                      BarChartRodData(
                          toY: e.y,
                          color: Colors.orangeAccent,
                          width: 25,
                          borderRadius: BorderRadius.circular(4)),
                    ],
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

Widget getBottomTiles(double value, TitleMeta titleMeta) {
  var style = TextStyle(
      color: Colors.grey.shade700, fontSize: 14, fontWeight: FontWeight.w700);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text(
        'S',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'M',
        style: style,
      );
      break;
    case 3:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 4:
      text = Text(
        'W',
        style: style,
      );
      break;
    case 5:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 6:
      text = Text(
        'F',
        style: style,
      );
      break;
    case 7:
      text = Text(
        'S',
        style: style,
      );
      break;
    default:
      text = Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: titleMeta.axisSide, child: text);
}
