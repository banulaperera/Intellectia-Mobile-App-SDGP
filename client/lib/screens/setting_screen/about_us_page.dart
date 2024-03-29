import 'package:flutter/Material.dart';

import '../../util/constants.dart';
import '../../util/screen_dimension.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: width * 0.05, // 5% of screen width
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.05), // 5% of screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: width * 0.175, // 17.5% of screen width
              backgroundImage: const AssetImage(
                  'assets/logo_image.jpeg'), // Add your logo image asset here
            ),
            SizedBox(height: height * 0.02), // 2% of screen height
            Text(
              'Welcome to Our App',
              style: TextStyle(
                fontSize: width * 0.06, // 6% of screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.01), // 1% of screen height
            Text(
              'We are dedicated to providing the best services and solutions for our customers.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: width * 0.045), // 4.5% of screen width
            ),
            SizedBox(height: height * 0.02), // 2% of screen height
            _buildTeamMembers(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMembers(BuildContext context) {
    ScreenDimensions.init(context);
    double width = ScreenDimensions.screenWidth;
    double height = ScreenDimensions.screenHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Team',
          style: TextStyle(
            fontSize: width * 0.05, // 5% of screen width
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height * 0.01), // 1% of screen height
        _buildTeamMemberItem(context, 'Banula Perera', 'banula.20212085@iit.ac.lk', 'assets/owner_images/banula.jpeg'),
        _buildTeamMemberItem(context, 'Hirushi Amarasinghe', 'hirushi.20212009@iit.ac.lk', 'assets/owner_images/hirushi.jpeg'),
        _buildTeamMemberItem(context, 'Avishka Pramuditha', 'avishka.20212079@iit.ac.lk', 'assets/owner_images/avishka.jpeg'),
        _buildTeamMemberItem(context, 'Kavisha Kumarage', 'kavisha.20212061@iit.ac.lk', 'assets/owner_images/kavisha.jpeg'),
        _buildTeamMemberItem(context, 'Nethunil Lakshitha', 'nethunil.20212066@iit.ac.lk', 'assets/owner_images/Nethunil.jpeg'),
      ],
    );
  }

  Widget _buildTeamMemberItem(BuildContext context, String name, String role, String imageUrl) {
    ScreenDimensions.init(context);
    double width = ScreenDimensions.screenWidth;

    return ListTile(
      leading: CircleAvatar(
        radius: width * 0.1, // 10% of screen width
        backgroundImage: AssetImage(
            imageUrl), // Add default avatar image asset here
      ),
      title: Text(name, style: TextStyle(fontSize: width * 0.04)), // 4% of screen width
      subtitle: Text(role, style: TextStyle(fontSize: width * 0.035)), // 3.5% of screen width
    );
  }
}