import 'package:get/get.dart';

class EligibilityCheckerController extends GetxController {
  var selectedItem = 'SPM'.obs; // Reactive variable
  final List<String> items = [
    'SPM',
    'SVM',
    'STPM',
  ]; // List of dropdown options

  // Method to navigate to the appropriate page based on selected item
}
