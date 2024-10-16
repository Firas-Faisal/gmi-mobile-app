import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:gmi_mobile_app/screen/home/controller/pre_u_controller.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart'; // Import the animation package

class PreUTab extends StatefulWidget {
  const PreUTab({super.key});

  @override
  _PreUTabState createState() => _PreUTabState();
}

class _PreUTabState extends State<PreUTab> {
  final PreUController controller = Get.put(PreUController());
  final ScrollController scrollController =
      ScrollController(); // Scroll Controller
  RxDouble opacity = 0.0.obs; // Opacity control variable

  @override
  void initState() {
    super.initState();
    // Initializing with a small delay to trigger fade-in when GUFP is selected
    Future.delayed(const Duration(milliseconds: 300), () {
      opacity.value = 1.0; // Start with fully visible after a delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return DropdownButton<String>(
              value: controller.selectedCategory.value,
              onChanged: (String? newValue) {
                controller.selectedCategory.value = newValue!;
                // Reset opacity when category changes
                if (newValue == 'GUFP') {
                  opacity.value = 0.0; // Set opacity to 0 for fade-in effect
                  Future.delayed(const Duration(milliseconds: 100), () {
                    opacity.value = 1.0; // Fade in after short delay
                  });
                } else {
                  opacity.value = 1.0; // Fully visible for other categories
                }
              },
              items: ['GAPP', 'GUFP']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
        ),

        // Dynamically display content based on the selected category
        Expanded(
          child: Obx(() {
            String selectedCategory = controller.selectedCategory.value;

            if (selectedCategory == 'GAPP') {
              // If GAPP is selected, display an image
              // If GUFP is selected, display multiple cards with scroll animation
              return Card(
                color: Colors.blue,
              );
            } else if (selectedCategory == 'GUFP') {
              // If GUFP is selected, display multiple cards with scroll animation
              return Opacity(
                opacity: opacity.value, // Control the opacity here
                child: SingleChildScrollView(
                  controller: scrollController, // Attach scrollController
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // First Card
                      FadeIn(
                        globalKey: GlobalKey(), // Add globalKey here
                        child: buildGUFPCard(
                          title: 'Programme Brief',
                          content:
                              'Germany is renowned for its technological achievements and higher education system. The German University Degree is highly respected worldwide and known for its strong practical orientation.',
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Second Card
                      FadeInDown(
                        globalKey: GlobalKey(), // Add globalKey here
                        delay: 200.ms,
                        child: buildGUFPCard(
                          title: 'Admission Requirements',
                          content:
                              'To enroll in the GUFP program, students must have at least “A” grades in English, Mathematics, and Science subjects, along with a strong academic background in general.',
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Third Card
                      FadeInUp(
                        globalKey: GlobalKey(), // Add globalKey here
                        delay: 400.ms,
                        child: buildGUFPCard(
                          title: 'Study Outline',
                          content:
                              'The GUFP program includes intensive German language courses, technical studies, and practical training in German universities over the span of 2 years.',
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Fourth Card
                      FadeInLeft(
                        globalKey: GlobalKey(), // Add globalKey here
                        delay: 600.ms,
                        child: buildGUFPCard(
                          title: 'Application Process',
                          content:
                              'Applications are submitted online via the university portal. Ensure you include all transcripts and recommendation letters. The deadline is June 30th.',
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Fifth Card
                      FadeInRight(
                        globalKey: GlobalKey(), // Add globalKey here
                        delay: 800.ms,
                        child: buildGUFPCard(
                          title: 'Fees and Scholarships',
                          content:
                              'The program costs approximately RM30,000, with scholarships available for top candidates sponsored by MARA and other private institutions.',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(); // Empty container if no category is selected
            }
          }),
        ),
      ],
    );
  }

  // Method to build a card
  Widget buildGUFPCard({required String title, required String content}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ReadMoreText(
              content,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.blue,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
