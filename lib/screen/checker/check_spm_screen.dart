import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/screen/checker/controller/check_spm_controller.dart';
import 'package:gmi_mobile_app/screen/checker/widget/radio_question_spm.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class SPMChecker extends StatelessWidget {
  final SPMController controller = Get.put(SPMController());

  SPMChecker({super.key});

  Widget _buildLaunchButton(String text, String url) {
    return ElevatedButton(
      onPressed: () => _launchUrl(url), // Launch the URL when pressed
      child: Text(text),
    );
  }

  // Function to launch URLs for both buttons
  Future<void> _launchUrl(String urlString) async {
    if (urlString.isEmpty) {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the entire column
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: [
            _buildQuestionCard(
              question: '1. Are you passing SPM?',
              children: [
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'Yes',
                    value: 'Yes',
                    groupValue: controller.spmAnswer.value,
                    onChanged: (String value) {
                      controller.updateSpmAnswer(value);
                    },
                  ),
                ),
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'No',
                    value: 'No',
                    groupValue: controller.spmAnswer.value,
                    onChanged: (String value) {
                      controller.updateSpmAnswer(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildQuestionCard(
              question: '2. Are your Math scores above C?',
              children: [
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'Yes',
                    value: 'Yes',
                    groupValue: controller.mathScoreAnswer.value,
                    onChanged: (String value) {
                      controller.updateMathScoreAnswer(value);
                    },
                  ),
                ),
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'No',
                    value: 'No',
                    groupValue: controller.mathScoreAnswer.value,
                    onChanged: (String value) {
                      controller.updateMathScoreAnswer(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildQuestionCard(
              question: '3. Are your Science scores above C?',
              children: [
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'Yes',
                    value: 'Yes',
                    groupValue: controller.scienceScoreAnswer.value,
                    onChanged: (String value) {
                      controller.updateScienceScoreAnswer(value);
                    },
                  ),
                ),
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'No',
                    value: 'No',
                    groupValue: controller.scienceScoreAnswer.value,
                    onChanged: (String value) {
                      controller.updateScienceScoreAnswer(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildQuestionCard(
              question:
                  '4. Do you have any technical subjects? Are they above C?',
              children: [
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'Yes',
                    value: 'Yes',
                    groupValue: controller.anyTechnicalSubject.value,
                    onChanged: (String value) {
                      controller.updateAnyTechnicalSubjectAnswer(value);
                    },
                  ),
                ),
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'No',
                    value: 'No',
                    groupValue: controller.anyTechnicalSubject.value,
                    onChanged: (String value) {
                      controller.updateAnyTechnicalSubjectAnswer(value);
                    },
                  ),
                ),
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'I have not taken any technical subject',
                    value: 'Not Taken',
                    groupValue: controller.anyTechnicalSubject.value,
                    onChanged: (String value) {
                      controller.updateAnyTechnicalSubjectAnswer(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildQuestionCard(
              question: '5. Did you pass English?',
              children: [
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'Yes',
                    value: 'Yes',
                    groupValue: controller.passEnglish.value,
                    onChanged: (String value) {
                      controller.updatePassEnglishAnswer(value);
                    },
                  ),
                ),
                Obx(
                  () => RadioButtonQuestionSPM(
                    title: 'No',
                    value: 'No',
                    groupValue: controller.passEnglish.value,
                    onChanged: (String value) {
                      controller.updatePassEnglishAnswer(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Add the TextField for the number of subjects above C
            _buildQuestionCard(
              question: '6. How many subjects are above C?',
              children: [
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter the number of subjects',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    controller.updateSubjectsAboveC(value);
                  },
                ),
                const SizedBox(height: 20),

                // Display the entered value
                Obx(
                  () => Text(
                    'You entered: ${controller.subjectsAboveC.value}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Output the final result based on the user's answers
            Obx(() => _buildEligibilityResult()),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(
      {required String question, required List<Widget> children}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildEligibilityResult() {
    bool passesSpm = controller.spmAnswer.value == 'Yes';
    bool passesEnglish = controller.passEnglish.value == 'Yes';
    int subjectsAboveC = int.tryParse(controller.subjectsAboveC.value) ?? 0;

    bool mathAboveC = controller.mathScoreAnswer.value == 'Yes';
    bool scienceAboveC = controller.scienceScoreAnswer.value == 'Yes';
    bool technicalAboveC = controller.anyTechnicalSubject.value == 'Yes';

    // Logic to check if the user can enter all courses
    if (passesSpm &&
        passesEnglish &&
        subjectsAboveC >= 3 &&
        mathAboveC &&
        (scienceAboveC || technicalAboveC)) {
      return Column(
        children: [
          _buildResultMessage(
            'You can enter all courses.',
            color: Colors.lightGreen[50],
          ),
          const SizedBox(height: 10), // Add some spacing
          _buildLaunchButton('Apply Now', 'https://gmi.vialing.com/oa/login'),
        ],
      );
    }

    // Logic to check if the user can only enter the Creative Multimedia course
    if (passesSpm && subjectsAboveC >= 3) {
      return Column(
        children: [
          _buildResultMessage(
              'You can only enter the Creative Multimedia course.'),
          const SizedBox(height: 10), // Add some spacing
          _buildLaunchButton('Apply Now', 'https://gmi.vialing.com/oa/login'),
        ],
      );
    }

    // If none of the above conditions are met
    return _buildResultMessage(
        'You are not eligible to enter any of the courses we offer.',
        color: Colors.red[100]);
  }

  Widget _buildResultMessage(String message, {Color? color}) {
    // Use the passed color for the card, and adjust the text color accordingly
    Color textColor = (color == Colors.red[100]) ? Colors.red : Colors.green;

    return Card(
      elevation: 3,
      color: color, // Set the card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor, // Set the text color based on the card color
          ),
        ),
      ),
    );
  }
}
