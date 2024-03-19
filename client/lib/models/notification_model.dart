class NotificationM {
  String? id;
  String title;
  String body;
  String type;
  DateTime date;

  NotificationM({
    this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.date});


  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'type': type,
      'date': date.toIso8601String(),
    };
  }



  factory NotificationM.fromJson(Map<String, dynamic> json){
    return NotificationM(
        id:json['_id'] as String,
        title: json['title'] as String,
        body:json['body'] as String,
        type:json['type'] as String,
        date:DateTime.parse(json['date'] as String).toLocal());
  }

}
