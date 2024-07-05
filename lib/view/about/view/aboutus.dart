import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/privacypolicy/widgets/policywidget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Column(
        children: [
          PolicyWidget(
            title: 'Welcome to Hidaya',
            desc:
                '''At Hidaya, our mission is to provide a comprehensive, user-friendly Islamic app that serves the needs of Muslims around the world. Our app is designed to be your companion in faith, offering a variety of features to help you stay connected with your Islamic practices and community.''',
          ),
          PolicyWidget(
            title: 'Our Vision',
            desc:
                '''We envision a world where technology supports and enhances spiritual growth and community connectivity. Hidaya aims to be a cornerstone in the daily lives of Muslims, making it easier to practice faith and stay informed about Islamic teachings.''',
          ),
          PolicyWidget(
            title: 'Our Team',
            desc:
                '''Hidaya is developed by a dedicated team of professionals who are passionate about using technology to enhance Islamic practices. Our team includes developers, designers, and Islamic scholars who work together to ensure that Hidaya is accurate, reliable, and beneficial.''',
          ),
          PolicyWidget(
            title: 'Contact Us',
            desc:
                '''We are always here to listen to our users and continuously improve our app. If you have any suggestions, feedback, or questions, please feel free to reach out to us.''',
          ),
        ],
      ),
    );
  }
}
