import 'package:flutter/Material.dart';

import '../../util/constants.dart';

class PrivacySecurity extends StatelessWidget {
  const PrivacySecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: const Text(
          'Privacy & Security',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Your Privacy Matters',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            _buildPrivacySection(),
            const SizedBox(height: 20.0),
            _buildSecuritySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacySection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Our privacy policy outlines our commitment to protecting your personal information and ensuring its secure handling in accordance with applicable laws and best practices.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20.0),
        Text(
          'Data Collection',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'We collect data only for the purpose of improving user experience and providing better services. Your data is securely stored and never shared with third parties without your consent.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSecuritySection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Security Measures',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Our comprehensive security measures employ state-of-the-art encryption protocols and robust authentication mechanisms to safeguard your data and ensure the integrity of our services.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20.0),
        Text(
          'Encryption',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'All data transmission is encrypted using industry-standard protocols to ensure your information remains confidential and secure.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
