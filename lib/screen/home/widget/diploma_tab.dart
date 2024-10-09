import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/screen/home/controller/diploma_controller.dart';
import 'package:gmi_mobile_app/screen/home/widget/course_card.dart';

class DiplomaTab extends StatelessWidget {
  // Instantiate the DiplomaController using GetX
  final DiplomaController controller = Get.put(DiplomaController());

  DiplomaTab({super.key});

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
              },
              items: ['ELECTRICAL', 'MECHANICAL', 'COMPUTER']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
        ),
        Expanded(
          child: Obx(() {
            // Get the selected category
            String selectedCategory = controller.selectedCategory.value;

            // Build a list of CourseCard based on the selected category
            return ListView.builder(
              itemCount: controller.courses[selectedCategory]!.length,
              itemBuilder: (context, index) {
                final course = controller.courses[selectedCategory]![index];
                return CourseCard(
                  title: course['title']!,
                  description: course['description']!,
                  programCode: course['programCode']!,
                  studyMode: course['studyMode']!,
                  fee: course['fee']!,
                  duration: course['duration']!,
                  image: course['image']!,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
