import 'package:flutter/material.dart'; // Import Flutter Material package for UI components.
import 'package:get/get.dart'; // Import GetX for state management and dependency injection.
import 'package:gmi_mobile_app/screen/diploma/controller/diploma_controller.dart';
import 'package:gmi_mobile_app/screen/diploma/widget/course_card.dart'; // Import the CourseCard widget to display course information.

class DiplomaTab extends StatelessWidget {
  // Instantiate the DiplomaController using GetX, allowing for state management.
  final DiplomaController controller = Get.put(DiplomaController());

  DiplomaTab({super.key}); // Constructor for the DiplomaTab widget.

  @override
  Widget build(BuildContext context) {
    return Column(
      // A vertical layout for the DiplomaTab widget.
      children: [
        Padding(
          padding:
              const EdgeInsets.all(16.0), // Add padding around the dropdown.
          child: Obx(() {
            // Obx is a reactive widget that rebuilds when the observable changes.
            return DropdownButton<String>(
              value: controller.selectedCategory
                  .value, // Set the current value of the dropdown to the selected category.
              onChanged: (String? newValue) {
                // Callback for when the user selects a new value.
                controller.selectedCategory.value =
                    newValue!; // Update the selected category in the controller.
              },
              items: [
                'ELECTRICAL',
                'MECHANICAL',
                'COMPUTER'
              ] // List of categories for the dropdown.
                  .map<DropdownMenuItem<String>>((String value) {
                // Map each category to a DropdownMenuItem.
                return DropdownMenuItem<String>(
                  value: value, // Set the value of the menu item.
                  child: Text(value), // Display the category name.
                );
              }).toList(), // Convert the list of DropdownMenuItem to a list.
            );
          }),
        ),
        Expanded(
          // Makes the ListView take up the remaining space in the column.
          child: Obx(() {
            // Another reactive widget to rebuild when the observable changes.
            // Get the currently selected category from the controller.
            String selectedCategory = controller.selectedCategory.value;

            // Build a list of CourseCard widgets based on the selected category.
            return ListView.builder(
              itemCount: controller.courses[selectedCategory]!
                  .length, // Get the number of courses in the selected category.
              itemBuilder: (context, index) {
                // Builder function for each item in the list.
                final course = controller.courses[selectedCategory]![
                    index]; // Retrieve the course data.
                return CourseCard(
                  title: course['title']!, // Title of the course.
                  description:
                      course['description']!, // Description of the course.
                  programCode:
                      course['programCode']!, // Program code for the course.
                  studyMode: course[
                      'studyMode']!, // Study mode (e.g., online, offline).
                  fee: course['fee']!, // Fee for the course.
                  duration: course['duration']!, // Duration of the course.
                  image: course['image']!,
                  readMoreUrl: course[
                      'readMoreUrl'], // Image associated with the course.
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
