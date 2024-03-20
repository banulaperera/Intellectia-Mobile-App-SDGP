

import 'package:client/models/notification_model.dart';
import 'package:client/repository/user_repository.dart';
import 'package:cron/cron.dart';

import '../models/user_model.dart';
import '../repository/notification_repository.dart';
import 'notification_service.dart';

class CronJob {
  static var currentUserLevel=0;
  final _cronYouTube = Cron();
  final _cronRank = Cron();

  _showYoutubeNotification() {
    _cronYouTube.schedule(Schedule.parse("30 10 * * 1,4,6"),
        () async => await _processYoutubeNotification());
  }

  _showRankNotification(){
    _cronRank.schedule(Schedule.parse("00 23 * * *"), () =>_processRankNotification());
  }

  _processRankNotification() async {
    User? userDetails =  await UserRepository().getUserDetails();
    if(userDetails != null){
      if(userDetails.level>currentUserLevel){
        String title= 'Congratulations..';
        String body ='You have reached level ${userDetails.level}. Keep pushing your limits';
          var notificationM=NotificationM(
              title: title,
              body: body,
              type: "rank",
              date:DateTime.now());

          await NotificationRepository().addNotification(notificationM);
          await NotificationService().showNotification(title,body);
          currentUserLevel=userDetails.level;
      }
    }
  }

  _processYoutubeNotification() async {
    List<String>? video=await NotificationRepository().getYoutubeNotificationLink();
    if(video != null){
      String title= 'Suggestions';
      String body ='New suggestion.check out this video on ${video[1]}';
      var notificationM=NotificationM(
          title: title,
          body: body,
          type: "youtube",
          date:DateTime.now(),
          link:  video[0]);

      await NotificationRepository().addNotification(notificationM);
      await NotificationService().showNotification(title,body);
    }
    await NotificationService().showNotification(
        "Suggestions", "New suggestion.check out this video on DBS");
  }

  getYouTubeCronJob() {
    return _cronYouTube;
  }

  initializeJobs(){
    _showYoutubeNotification();
    _showRankNotification();
  }
}
