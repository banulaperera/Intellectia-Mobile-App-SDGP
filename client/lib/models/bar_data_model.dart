import 'bargraph_model.dart';

class BarData {
  final double mondayExp;
  final double tueExp;
  final double wensExp;
  final double thurExp;
  final double friExp;
  final double satExp;
  final double sunExp;

  BarData({
    required this.mondayExp,
    required this.tueExp,
    required this.wensExp,
    required this.thurExp,
    required this.friExp,
    required this.satExp,
    required this.sunExp,
  });

  List<IndividualBar> barData = [];

  void initializeBarData(){
    barData = [
      IndividualBar(x: 1, y: mondayExp),
      IndividualBar(x: 2, y: tueExp),
      IndividualBar(x: 3, y: thurExp),
      IndividualBar(x: 4, y: wensExp),
      IndividualBar(x: 5, y: friExp),
      IndividualBar(x: 6, y: satExp),
      IndividualBar(x: 7, y: sunExp),
    ];
  }
}
