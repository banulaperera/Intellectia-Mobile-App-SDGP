import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:flutter/Material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(
                width: 4, color: Theme.of(context).scaffoldBackgroundColor),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 10),
              ),
            ],
            shape: BoxShape.circle,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/logo_image.jpeg'),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Icon(
              BootstrapIcons.pencil_fill,
              size: 17,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
