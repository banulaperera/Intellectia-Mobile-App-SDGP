import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:flutter/material.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});
  @override
  State<UserProfile> createState() => _UserProfileState();
}
class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(
                    BootstrapIcons.gear_wide_connected,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: 150,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
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
      ),
    );
  }
}