import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
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
            maxRadius: 75,
            minRadius: 75,
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
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: kBackgroundColor,
                    ),
              ),
              SizedBox(height: 5),
              Text(
                'banulaperera@hcl.com',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.0,
                      color: kBackgroundColor,
                    ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset('animations/Animation - 1709315159426.json',
                      width: 90, height: 90, reverse: true, repeat: true),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Level 90',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18.0,
                      color: kBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
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
