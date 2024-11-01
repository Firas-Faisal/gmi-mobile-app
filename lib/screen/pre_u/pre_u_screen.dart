import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/screen/pre_u/controller/pre_u_controller.dart';
import 'package:gmi_mobile_app/screen/gapp/gapp_screen.dart';
import 'package:gmi_mobile_app/screen/gufp/gufp_screen.dart';

class PreUTab extends StatelessWidget {
  PreUTab({super.key});

  final PreUController controller = Get.put(PreUController());
  final ScrollController scrollController =
      ScrollController(); // Scroll Controller

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown for category selection
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return DropdownButton<String>(
              value: controller.selectedCategory.value,
              onChanged: (String? newValue) {
                controller.changeCategory(
                    newValue!); // Update category and opacity in the controller
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
              // If GAPP is selected, display the GAPP widget with opacity

              return Opacity(
                opacity: controller
                    .opacity.value, // Bind opacity to controller's value
                child: GAPP(
                  opacity: controller.opacity,
                  scrollController: scrollController,
                ),
              );
            } else if (selectedCategory == 'GUFP') {
              // If GUFP is selected, display a simple card or any other widget

              return Opacity(
                opacity: controller
                    .opacity.value, // Bind opacity to controller's value
                child: GUFP(
                  opacity: controller.opacity,
                  scrollController: scrollController,
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
}
