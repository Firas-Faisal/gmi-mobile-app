import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  const SocialIconButton(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor:
            Colors.blue[900], // Keep the avatar background the same
        radius: 24,
        child: IconButton(
          icon: Icon(icon,
              color: Colors.white,
              size: 24), // Change icon color to white for better contrast
          onPressed: () async {
            await _launchUrl(icon); // Ensure async handling
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl(IconData icon) async {
    String urlString = '';

    switch (icon) {
      case FontAwesomeIcons.facebook:
        urlString = 'https://www.facebook.com/germanmalaysianinstitute';
        break;
      case FontAwesomeIcons.twitter:
        urlString = 'https://twitter.com/gmiofficial92';
        break;
      case FontAwesomeIcons.instagram:
        urlString = 'https://www.instagram.com/gmi.edu.my';
        break;
      case FontAwesomeIcons.youtube:
        urlString = 'https://youtube.com/channel/UCbMySMz4KlW8MSmGiW64bNw';
        break;
      case FontAwesomeIcons.tiktok:
        urlString = 'https://www.tiktok.com/@germanmalaysianinstitute';
        break;
      case FontAwesomeIcons.linkedin:
        urlString = 'https://www.linkedin.com/company/gmi_official/';
        break;
      default:
        debugPrint('Invalid icon');
        return;
    }

    if (urlString.isNotEmpty) {
      final Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        debugPrint('Could not launch $urlString');
      }
    }
  }
}
