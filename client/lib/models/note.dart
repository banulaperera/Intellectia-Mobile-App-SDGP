class Note{
  String? id;
  String moduleName;
  DateTime createdDate;
  DateTime lastModifiedDate;
  String title;
  String content;

  Note({this.id,required this.moduleName,required this.createdDate, required this.lastModifiedDate,required this.title,required this.content});

  Map<String,dynamic> toJsonWithID(){
    return {
      '_id':id,
      'moduleName':moduleName,
      'createdDate':createdDate.toIso8601String(),
      'lastModifiedDate':lastModifiedDate.toIso8601String(),
      'title':title,
      'content':content
    };
  }

  Map<String,dynamic> toJsonWithOutID(){
    return {
      'moduleName':moduleName,
      'createdDate':createdDate.toIso8601String(),
      'lastModifiedDate':lastModifiedDate.toIso8601String(),
      'title':title,
      'content':content
    };
  }

 factory Note.fromJson(Map<String,dynamic> json){
    return Note(
        id:json['_id'] as String,
        moduleName: json['moduleName'] as String,
        createdDate:DateTime.parse(json['createdDate'] as String).toLocal(),
        lastModifiedDate:DateTime.parse(json['lastModifiedDate'] as String).toLocal(),
        title:json['title'] as String,
        content:json['content'] as String);
  }

}

