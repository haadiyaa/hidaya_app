import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/privacypolicy/widgets/policywidget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Column(
        children: [
          PolicyWidget(
            title: 'Introduction',
            desc:
                '''Hidaya ("we," "our," "us") is committed to protecting and respecting your privacy. This Privacy Policy explains how we collect, use, and disclose information about you when you use our mobile application, Hidaya ("the App").''',
          ),
          PolicyWidget(
            title: 'Information We Collect',
            desc:
                '''We may collect and process the following information about you:

1. Personal Information
Account Information: If you create an
account, we may collect your name, email
address, and other contact information.
Prayer Times and Location: To provide
accurate prayer times and Qibla direction,
we collect your device's location data.
2. Non-Personal Information
Usage Data: We may collect information
about how you use the App, including your
interactions with the features, the duration
of your sessions, and other diagnostic data.''',
          ),
          PolicyWidget(
            title: 'How We Use Your Information',
            desc: '''We use the information we collect for
various purposes, including:
To Provide and Maintain the App:
To deliver the features and services you
request, such as accurate prayer times,
Quran recitation, and reminders.
To Improve the App: To understand how
you use the App and make improvements.
To Communicate with You: To send you
updates, notifications, and other information
related to the App.
To Provide Customer Support: To address
your inquiries and resolve any issues you
might be experiencing with the App.''',
          ),
        ],
      ),
    );
  }
}
