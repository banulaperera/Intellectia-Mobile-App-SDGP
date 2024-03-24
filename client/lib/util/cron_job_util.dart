
import 'package:cron/cron.dart';
import 'notification_service.dart';

class CronJobService {

  final _cronYouTube = Cron();
  Cron _quizCronJob = Cron();
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
    _quizCronJob.close();
    _quizCronJob=Cron();
    scheduledModuleName=moduleName;
    _quizCronJob.schedule(Schedule.parse(time), () async =>await NotificationService().showQuizNotification(moduleName));
   }


}
