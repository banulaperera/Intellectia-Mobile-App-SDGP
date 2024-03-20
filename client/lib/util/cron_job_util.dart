
import 'package:cron/cron.dart';
import 'notification_service.dart';

class CronJob {

  final _cronYouTube = Cron();


  initializeJobs(){
    _showYoutubeNotification();
  }

  _showYoutubeNotification() {
    _cronYouTube.schedule(Schedule.parse("30 10 * * 1,4,6"),
        () async => await NotificationService().showYoutubeNotification());
  }

  getYouTubeCronJob() {
    return _cronYouTube;
  }


}
