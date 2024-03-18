
import 'dart:ui';

import 'package:client/models/notification_model.dart';
import 'package:cron/cron.dart';


import '../repository/notification_repository.dart';
import 'notification_service.dart';

class CronJob{
    final _cronYouTube=Cron();

   showYoutubeNotification(){
     _cronYouTube.schedule(Schedule.parse("30 10 * * 1,4,6"), ()async =>await _processYoutubeNotification() );
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
    }

    getYouTubeCronJob(){
     return _cronYouTube;
    }

}


