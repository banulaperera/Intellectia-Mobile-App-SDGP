import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/widget/notification_title.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/notification_model.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Notifications> newList = [];
  List<Notifications> oldList = [];

  @override
  void initState(){
    newList = Notifications.listOfNotifications();
    oldList = newList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 2),
          ),
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: .2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            icon: BootstrapIcons.trash3_fill,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: NotificationTitle(newList[index],)
                    );
                  },
                  itemCount: newList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Last Week',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: .2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            icon: BootstrapIcons.trash3_fill,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: NotificationTitle(oldList[index],),
                    );
                  },
                  itemCount: oldList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}