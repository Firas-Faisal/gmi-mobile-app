import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmi_mobile_app/drawer.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // Ensures that Flutter is fully initialized before running the app
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Keep the splash screen visible while asynchronous operations complete
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Simulating some background operations like data loading or API calls
  await loadData();

  // Remove the splash screen after the loading process is complete
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

// Simulating an async function that takes time to load data
Future<void> loadData() async {
  // Simulate a network request or any other background task
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Gmi Mobile App';

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: appTitle,
      home: HamburgerMenu(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EligibilityChecker extends StatelessWidget {
//   final EligibilityController controller = Get.put(EligibilityController());

//   EligibilityChecker({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Eligibility Checker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text('Did you pass SPM?'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Radio(
//                   value: true,
//                   groupValue: controller.spmPassed.value,
//                   onChanged: (value) {
//                     controller.spmPassed.value = value as bool;
//                   },
//                 ),
//                 Text('Yes'),
//                 Radio(
//                   value: false,
//                   groupValue: controller.spmPassed.value,
//                   onChanged: (value) {
//                     controller.spmPassed.value = value as bool;
//                   },
//                 ),
//                 Text('No'),
//               ],
//             ),
//             DropdownButton<String>(
//               hint: Text('Select Math Grade'),
//               value: controller.mathGrade.value.isEmpty
//                   ? null
//                   : controller.mathGrade.value,
//               onChanged: (value) {
//                 controller.mathGrade.value = value!;
//               },
//               items: ['A', 'B', 'C', 'D', 'E', 'F']
//                   .map((grade) => DropdownMenuItem(
//                         value: grade,
//                         child: Text(grade),
//                       ))
//                   .toList(),
//             ),
//             DropdownButton<String>(
//               hint: Text('Select Science/Technical Grade'),
//               value: controller.scienceGrade.value.isEmpty
//                   ? null
//                   : controller.scienceGrade.value,
//               onChanged: (value) {
//                 controller.scienceGrade.value = value!;
//               },
//               items: ['A', 'B', 'C', 'D', 'E', 'F']
//                   .map((grade) => DropdownMenuItem(
//                         value: grade,
//                         child: Text(grade),
//                       ))
//                   .toList(),
//             ),
//             DropdownButton<String>(
//               hint: Text('Select Other Subject Grade'),
//               value: controller.otherSubjectGrade.value.isEmpty
//                   ? null
//                   : controller.otherSubjectGrade.value,
//               onChanged: (value) {
//                 controller.otherSubjectGrade.value = value!;
//               },
//               items: ['A', 'B', 'C', 'D', 'E', 'F']
//                   .map((grade) => DropdownMenuItem(
//                         value: grade,
//                         child: Text(grade),
//                       ))
//                   .toList(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 String result = controller.checkEligibility();
//                 Get.defaultDialog(
//                     title: 'Eligibility Result', middleText: result);
//               },
//               child: Text('Check Eligibility'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EligibilityController extends GetxController {
//   var spmPassed = false.obs;
//   var mathGrade = ''.obs;
//   var scienceGrade = ''.obs;
//   var otherSubjectGrade = ''.obs;

//   String checkEligibility() {
//     if (!spmPassed.value) {
//       return 'You are not eligible to take any course.';
//     }

//     bool hasMathCredit =
//         mathGrade.value.isNotEmpty && ['A', 'B', 'C'].contains(mathGrade.value);
//     bool hasScienceCredit = scienceGrade.value.isNotEmpty &&
//         ['A', 'B', 'C'].contains(scienceGrade.value);
//     bool hasOtherCredit = otherSubjectGrade.value.isNotEmpty &&
//         ['A', 'B', 'C'].contains(otherSubjectGrade.value);

//     if (hasMathCredit && hasScienceCredit && hasOtherCredit) {
//       return 'You can take all the courses.';
//     } else if (spmPassed.value &&
//         (hasMathCredit || hasScienceCredit || hasOtherCredit)) {
//       return 'You can just take CRM.';
//     }

//     return 'You are not eligible to take any course.';
//   }
// }
