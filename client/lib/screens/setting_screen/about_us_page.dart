import 'package:flutter/Material.dart';

import '../../constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'About Us',
          style: TextStyle(
            fontSize: appBarTitleSize,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                  'assets/logo_image.jpeg'), // Add your logo image asset here
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Welcome to Our App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'We are dedicated to providing the best services and solutions for our customers.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20.0),
            _buildTeamMembers(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMembers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Team',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        _buildTeamMemberItem(context, 'Banula Perera', 'banula.20212085@iit.ac.lk', 'assets/owner_images/banula.jpeg'),
        _buildTeamMemberItem(context, 'Hirushi Amarasinghe', 'hirushi.20212009@iit.ac.lk', 'assets/owner_images/hirushi.jpeg'),
        _buildTeamMemberItem(context, 'Avishka Pramuditha', 'avishka.20212079@iit.ac.lk', 'assets/owner_images/avishka.jpeg'),
        _buildTeamMemberItem(context, 'Kavisha Kumarage', 'kavisha.20212061@iit.ac.lk', 'assets/owner_images/kavisha.jpeg'),
        _buildTeamMemberItem(context, 'Nethunil Lakshitha', 'nethunil.20212066@iit.ac.lk', 'assets/owner_images/Nethunil.jpeg'),
      ],
    );
  }

  Widget _buildTeamMemberItem(BuildContext context, String name, String role, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
            imageUrl), // Add default avatar image asset here
      ),
      title: Text(name),
      subtitle: Text(role),
    );
  }
}
