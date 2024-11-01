import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/screen/gufp/widget/bullet_point.dart';

class GUFP extends StatelessWidget {
  const GUFP({
    super.key,
    required this.opacity,
    required this.scrollController,
  });
  Widget buildCheckList(List<String> items) {
    return Wrap(
      spacing: 8, // Space between items
      runSpacing: 8, // Space between rows
      children: items
          .map((item) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 5),
                  Text(
                    item,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ))
          .toList(),
    );
  }

  final RxDouble opacity;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value, // Control the opacity here
      child: SingleChildScrollView(
        controller: scrollController, // Attach scrollController
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Programme Code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '(R3/010/3/0447) (04/27) (A 7643)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            // First Card
            FadeIn(
              globalKey: GlobalKey(), // Add globalKey here
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Why GUFP?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      BulletPoint(
                          text:
                              "Introduction to German Culture and basic language during foundation year."),
                      BulletPoint(
                          text: "Field Trip to German Industry/Company."),
                      BulletPoint(
                          text:
                              "Opportunities to place internship in Germany."),
                      BulletPoint(text: "Student Exchange in Germany."),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Second Card
            FadeInDown(
              globalKey: GlobalKey(), // Add globalKey here
              delay: 200.ms,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Brief Introduction',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "GMI-UTP Foundation Programme (GUFP) is strategic partnership between GMI (German Malaysian Institute) and UTP (Universiti Teknologi PETRONAS). This programme is a one year foundation programme based on UTP foundation syllabus. Upon completion, students will be qualified to start their Undergraduate Programme at UTP.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // // Fourth Card
            FadeInLeft(
              globalKey: GlobalKey(), // Add globalKey here
              delay: 600.ms,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'The Pathway',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFF01579B), // Deep blue background color
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          child: const Text(
                            'SPM or Other Qualifications',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, // Yellow text color
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Icon(
                          Icons.arrow_downward,
                          size: 40,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFF01579B), // Deep blue background color
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          child: const Text(
                            'Foundation Programme in Collaboration with Universiti Teknologi PETRONAS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, // Yellow text color
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'JPT/BPP(K)1000-600/B293-Jls 6(25)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black, // Yellow text color
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          'Foundation in Engineering & Science',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black, // Yellow text color
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Icon(
                          Icons.arrow_downward,
                          size: 40,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFF01579B), // Deep blue background color
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          child: const Text(
                            'Degree Programmes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, // Yellow text color
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const BulletPoint(
                          text:
                              "Bachelor of Chemical Engineering with Honours"),
                      const BulletPoint(
                          text: "Bachelor of Civil Engineering with Honours"),
                      const BulletPoint(
                          text:
                              "Bachelor of Electrical & Electronics Engineering with Honours"),
                      const BulletPoint(
                          text:
                              "Bachelor of Science (Hons) Petroleum Geoscience"),
                      const BulletPoint(
                          text:
                              "Bachelor of Petroleum Engineering with Honours"),
                      const BulletPoint(
                          text:
                              "Bachelor of Materials Engineering with Honours"),
                      const BulletPoint(
                          text:
                              "Bachelor of Mechanical Engineering with Honours"),
                      const BulletPoint(
                          text:
                              "Bachelor of Computer Engineering with Honours"),
                      const BulletPoint(
                          text:
                              "Bachelor of Science (Hons) in Applied Chemistry"),
                      const BulletPoint(
                          text:
                              "Bachelor of Science (Hons) in Applied Physics"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FadeInDown(
              globalKey: GlobalKey(), // Add globalKey here
              delay: 200.ms,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Entry Requirement',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Sponsored Candidate Section

                      const Text(
                        'Possesses Sijil Pelajaran Malaysia (SPM) with minimum grade C in:',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      buildCheckList([
                        'English',
                        'Mathematics',
                        'Additional Mathematics',
                        'Physics',
                        'Chemistry',
                        'Bahasa Melayu',
                      ]),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey[400]),
                      const SizedBox(height: 20),
                      // Private Candidate Section

                      const Text(
                        'Pass O-Level with minimum grade C in five subjects inclusive of:',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      buildCheckList([
                        'Physics',
                        'Mathematics',
                        'Chemistry',
                        '2 Other Subjects',
                      ]),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Function to launch URLs for both buttons
}
