import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:flutter/material.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 50,
            minRadius: 50,
            backgroundColor: Colors.grey.shade800,
            backgroundImage: const AssetImage(
              'assets/logo_image.jpeg',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Banula Perera',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: kBackgroundColor,
                    ),
              ),
              Text(
                'banulaperera@hcl.com',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.0,
                      color: kBackgroundColor,
                    ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level 90',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.0,
                          color: kBackgroundColor,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    BootstrapIcons.fire,
                    color: Colors.orange,
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
