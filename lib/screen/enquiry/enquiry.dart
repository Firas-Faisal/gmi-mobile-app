import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gmi_mobile_app/screen/enquiry/widget/social_icon_button.dart';

class EnquiryScreen extends StatelessWidget {
  const EnquiryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.9, // Set the width for the card
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.grey[200], // Changed to a lighter color
                elevation: 8,
                shadowColor: Colors.black45,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // GMi Logo
                      Image(
                        image: AssetImage('asset/images/logo-gmi-header.webp'),
                        height: 100,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'FOLLOW US ON SOCIAL MEDIA:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors
                              .black, // Changed to black for better contrast
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16.0,
                        runSpacing: 10.0,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          SocialIconButton(FontAwesomeIcons.facebook),
                          SocialIconButton(FontAwesomeIcons.twitter),
                          SocialIconButton(FontAwesomeIcons.instagram),
                          SocialIconButton(FontAwesomeIcons.youtube),
                          SocialIconButton(FontAwesomeIcons.tiktok),
                          SocialIconButton(FontAwesomeIcons.linkedin),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(color: Colors.black54),
                      SizedBox(height: 8),
                      Text(
                        'KPT(JPS)600-48/B/103(2)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'No. Perakuan Pendaftaran: DK040(B)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors
                              .black54, // Changed to dark gray for better contrast
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeIn(
              globalKey: GlobalKey(),
              child: SizedBox(
                width:
                    screenWidth * 0.9, // Ensure same width for the second card
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[200], // Changed to a lighter color
                  elevation: 8,
                  shadowColor: Colors.black45,
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'CONTACT INFORMATION',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors
                                .black, // Changed to black for better contrast
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'German-Malaysian Institute (199201016476)\n'
                          'Jalan Ilmiah, Taman Universiti,\n'
                          '43000, Kajang, Selangor, Malaysia',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black54, // Changed to dark gray for better contrast
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Tel : +603-8921 9000 / 9191 / 9046 / 9322',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black54, // Changed to dark gray for better contrast
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Fax : +603-8921 9001',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black54, // Changed to dark gray for better contrast
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Email : marketing@gmi.edu.my',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors
                                .black54, // Changed to dark gray for better contrast
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
