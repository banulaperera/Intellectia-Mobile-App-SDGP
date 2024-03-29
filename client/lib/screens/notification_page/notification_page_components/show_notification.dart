import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/models/notification_model.dart';
import 'package:client/screens/notification_page/notification_page_components/notification_title.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../controllers/notification_controller.dart';
import '../../../util/screen_dimension.dart';

class ShowNotification extends StatelessWidget {
  ShowNotification({
    super.key,
    required this.list,
  });

  final List<NotificationM> list;
  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.001),
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: .2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  await notificationController
                      .deleteNotification(list[index].id!);
                },
                icon: BootstrapIcons.trash3_fill,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red.withOpacity(0.5),
              )
            ],
          ),
          child: NotificationTitle(
            list[index],
          ),
        );
      },
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}