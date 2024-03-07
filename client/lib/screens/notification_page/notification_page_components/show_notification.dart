import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/models/notification_model.dart';
import 'package:client/screens/notification_page/notification_page_components/notification_title.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShowNotification extends StatelessWidget {
  const ShowNotification({
    super.key,
    required this.list,
  });

  final List<Notifications> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
