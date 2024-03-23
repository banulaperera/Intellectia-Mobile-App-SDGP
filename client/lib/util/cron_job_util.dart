
import 'package:cron/cron.dart';
import 'notification_service.dart';

class CronJobService {

  final _cronYouTube = Cron();
  late Cron quizCronJob;
  late String scheduledModuleName;


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

   addQuizSchedule(String time,moduleName){
    quizCronJob=Cron();
    scheduledModuleName=moduleName;
    quizCronJob.schedule(Schedule.parse(time), () => null);
   }


}
