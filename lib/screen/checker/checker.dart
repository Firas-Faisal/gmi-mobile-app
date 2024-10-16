import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/screen/checker/check_STPM.dart';
import 'package:gmi_mobile_app/screen/checker/widget/check_spm.dart';
import 'package:gmi_mobile_app/screen/checker/check_svm.dart';
import 'package:gmi_mobile_app/screen/checker/controller/checker_controller.dart';

class EligibilityCheckerScreen extends StatelessWidget {
  final EligibilityCheckerController controller =
      Get.put(EligibilityCheckerController());

  EligibilityCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown at the top
        Padding(
          padding:
              const EdgeInsets.all(16.0), // Add padding around the dropdown
          child: Center(
            child: Obx(
              () => DropdownButton<String>(
                value: controller.selectedItem.value,
                items: controller.items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedItem.value = newValue;
                  }
                },
              ),
            ),
          ),
        ),
        // Scrollable content below the dropdown
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding for content
              child: Obx(() {
                if (controller.selectedItem.value == 'SPM') {
                  return SPMChecker();
                } else if (controller.selectedItem.value == 'SVM') {
                  return const SVMChecker();
                } else if (controller.selectedItem.value == 'STPM') {
                  return const STPMChecker();
                } else {
                  Get.snackbar('Error', 'Invalid selection');
                  return Container();
                }
              }),
            ),
          ),
        ),
      ],
    );
  }
}
