import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class GAPP extends StatelessWidget {
  const GAPP({
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
    return Obx(
      () => Opacity(
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Slightly larger radius for smoother corners
                    ),
                    elevation:
                        6, // Increased elevation for a more pronounced shadow
                    margin: const EdgeInsets.all(
                        16.0), // Increased margin for better spacing
                    child: const Padding(
                      padding: EdgeInsets.all(
                          20.0), // Increased padding for better content spacing
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Programme Brief',
                            style: TextStyle(
                              fontSize: 22, // Increased font size for the title
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, // Changed color to match a cohesive theme
                            ),
                          ),
                          SizedBox(height: 10),
                          ReadMoreText(
                            'Germany land of many opportunities, renowned for its technological achievements and the German higher education is one of the best in the world! A German university degree is highly respected by employers around the world and those from the Universities of Applied Science are very practice-oriented. For these reasons, the German A-Level Preparatory Program (GAPP) was established at the German-Malaysian Institute in 2001 to prepare and qualify young Malaysians to further their study in the fields of engineering at the University of Applied Sciences which requires A Levels, TesfDAF and Vorpraktikum qualifications for enrolment.',
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            colorClickableText: Colors.blue,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                              fontSize: 16, // Slightly increased font size
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .blueAccent, // Changed color for "Show more" text
                            ),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87), // Content text style
                          ),
                          SizedBox(
                              height: 10), // Space between content and button
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 10),

              // Second Card
              FadeInDown(
                globalKey: GlobalKey(), // Add globalKey here
                delay: 200.ms,
                child: Card(
                  margin: const EdgeInsets.all(16.0),
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
                          'GAPP Admission Requirement',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Sponsored Candidate Section
                        const Text(
                          'Sponsored Candidate',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          'SPM or equivalent with “A” for:',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        buildCheckList([
                          'English',
                          'Mathematics',
                          'Additional Mathematics',
                          'Physics',
                          'Chemistry',
                          '2 Other Subjects',
                        ]),
                        const SizedBox(height: 20),
                        Divider(color: Colors.grey[400]),
                        const SizedBox(height: 20),
                        // Private Candidate Section
                        const Text(
                          'Private Candidate',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          'SPM or equivalent with “C” for:',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        buildCheckList([
                          'English',
                          'Mathematics',
                          'Additional Mathematics',
                          'Physics',
                          'Chemistry',
                          '2 Other Subjects',
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Third Card
              FadeInUp(
                globalKey: GlobalKey(), // Add globalKey here
                delay: 400.ms,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Programme',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Students will undergo a 22-month preparatory programme at GMI, and also a 6-month intensive German Language training at various language centres in Germany before they are accepted for enrolment at the University of Applied Sciences (UAS).',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        SizedBox(height: 20),
                        ExpansionTile(
                          leading: Icon(Icons.add, color: Colors.white),
                          title: Text(
                            '6 – MONTH PROGRAMME AT LANGUAGE CENTRES IN GERMANY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          backgroundColor: Colors.black87,
                          collapsedBackgroundColor: Colors.black87,
                          childrenPadding: EdgeInsets.all(16),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.circle, size: 10),
                                  title: Text(
                                    'German Language from B2 – TestDAF',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.circle, size: 10),
                                  title: Text(
                                    'Intensive Intercultural and Study Skill Workshop',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.circle, size: 10),
                                  title: Text(
                                    'Advice on study placement',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.circle, size: 10),
                                  title: Text(
                                    'Technical German',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.circle, size: 10),
                                  title: Text(
                                    'Internship (depends on placement)',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Fourth Card
              FadeInLeft(
                globalKey: GlobalKey(), // Add globalKey here
                delay: 600.ms,
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
                        Center(
                          child: Text(
                            'Study Outline',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                        Text(
                          'University Placement in GERMANY',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The University of Applied Science (UAS) is a higher institution whose degree '
                          'offers a greater practical-focused courses with very much application-based. '
                          'The course work provides the theoretical background and prepares students '
                          'for the real-world requirements of professional life. Internships and practical '
                          'semesters form an integral part of the degree programmes.',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Qualified students, after completing the programme at GMI and also at '
                          'German Language centres, will apply to study in any University of Applied '
                          'Sciences (UAS) or Hochschule in the Federal Republic of Germany.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Fifth Card
              FadeInRight(
                globalKey: GlobalKey(), // Add globalKey here
                delay: 800.ms,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Application & Study Fee',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'FEES : RM40,000.00 for 4 semesters*',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          '*subject to change',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Students who wish to apply via MARA Young Talent Development Program (YTDP) can apply by clicking the button below:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => _launchUrl(
                              'https://www.mara.gov.my'), // Read More URL

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal, // Change button color
                          ),
                          child: const Text(
                            'Apply Via MARA YTP',
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Students who wish to self-finance may apply online by clicking the button below:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              _launchUrl('https://sis.sqayy.com/onlineapp/'),
                          child: const Text('Apply Now'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
