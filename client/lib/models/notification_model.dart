class Notifications {
  String path;
  String titleName;
  String titleTime;
  String description;

  Notifications(
      {required this.path,
      required this.titleName,
      required this.description,
      required this.titleTime});

  static List<Notifications> listOfNotifications() {
    List<Notifications> list = [
      Notifications(
          path: 'assets/youtube.png',
          titleName: 'Suggestions',
          description:
              'New suggestion. Check out this video on Database Management.',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/fire.png',
          titleName: 'Congratulations..',
          description: 'You have ranked up and now you are a Master!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/target.png',
          titleName: 'Quiz!!!',
          description:
              'You have already missed a quiz today. click to take the quiz!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/youtube.png',
          titleName: 'Suggestions',
          description:
              'New suggestion. Check out this video on Database Management.',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/fire.png',
          titleName: 'Congratulations..',
          description: 'You have ranked up and now you are a Master!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/target.png',
          titleName: 'Quiz!!!',
          description:
              'You have already missed a quiz today. click to take the quiz!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/youtube.png',
          titleName: 'Suggestions',
          description:
              'New suggestion. Check out this video on Database Management.',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/fire.png',
          titleName: 'Congratulations..',
          description: 'You have ranked up and now you are a Master!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/target.png',
          titleName: 'Quiz!!!',
          description:
              'You have already missed a quiz today. click to take the quiz!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/youtube.png',
          titleName: 'Suggestions',
          description:
              'New suggestion. Check out this video on Database Management.',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/fire.png',
          titleName: 'Congratulations..',
          description: 'You have ranked up and now you are a Master!',
          titleTime: '2h Ago'),
      Notifications(
          path: 'assets/target.png',
          titleName: 'Quiz!!!',
          description:
              'You have already missed a quiz today. click to take the quiz!',
          titleTime: '2h Ago'),
    ];

    return list;
  }
}
