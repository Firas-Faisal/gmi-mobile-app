import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String programCode;
  final String studyMode;
  final String fee;
  final String duration;
  final String image;
  final String? applyUrl; // URL for APPLY NOW
  final String? readMoreUrl; // URL for READ MORE

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.programCode,
    required this.studyMode,
    required this.fee,
    required this.duration,
    required this.image,
    this.applyUrl,
    this.readMoreUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF005BBB),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () =>
                            _launchUrl(readMoreUrl), // Read More URL
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF005BBB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'READ MORE',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Programme Code: $programCode',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Status: Accredited',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Study Mode: $studyMode',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Fee: $fee',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Duration: $duration',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to launch URLs for both buttons
  Future<void> _launchUrl(String? urlString) async {
    if (urlString == null || urlString.isEmpty) {
      debugPrint('Invalid URL');
      return;
    }

    final Uri url = Uri.parse(urlString);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Could not launch $urlString');
      throw Exception('Could not launch $urlString');
    }
  }
}
