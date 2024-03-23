class ScheduleQuizDetail {
  String? id;
  String preferredModuleName;
  DateTime preferredTime;
  String preferredFrequency;

  ScheduleQuizDetail(
      {this.id,
      required this.preferredModuleName,
      required this.preferredTime,
      required this.preferredFrequency});

  Map<String, dynamic> toJsonWithID() {
    return {
      '_id': id,
      'preferredModuleName': preferredModuleName,
      'preferredTime': preferredTime.toIso8601String(),
      'preferredFrequency': preferredFrequency,
    };
  }

  Map<String, dynamic> toJsonWithOutID() {
    return {
      'preferredModuleName': preferredModuleName,
      'preferredTime': preferredTime.toIso8601String(),
      'preferredFrequency': preferredFrequency,
    };
  }

  factory ScheduleQuizDetail.fromJson(Map<String, dynamic> json) {
    return ScheduleQuizDetail(
        id: json['_id'] as String,
        preferredModuleName: json['preferredModuleName'] as String,
        preferredTime:
            DateTime.parse(json['preferredTime'] as String).toLocal(),
        preferredFrequency: json['preferredFrequency'] as String);
  }
}
