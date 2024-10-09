import 'package:flutter/material.dart';
import 'package:gmi_mobile_app/screen/home/widget/diploma_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const TabBar(
              isScrollable: false,
              unselectedLabelColor: Colors.grey, // Other tabs color

              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  child: Text('DIPLOMA'),
                ),
                Tab(
                  child: Text('PRE-UNIVERSITY PROGRAMME'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DiplomaTab(), // No const here since it's a StatefulWidget
                  const Center(
                    child: Text('Gapp Content'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DiplomaTab extends StatefulWidget {
//   const DiplomaTab({super.key});

//   @override
//   State<DiplomaTab> createState() => _DiplomaTabState();
// }

// class _DiplomaTabState extends State<DiplomaTab> {
//   String selectedCategory = 'Electrical';

//   final Map<String, List<Map<String, String>>> courses = {
//     'Electrical': [
//       {
//         'title': 'Electrical Course 1',
//         'description': 'Basics of electrical systems.',
//         'programCode': 'R2/5234/0245',
//         'studyMode': 'Full Time',
//         'fee': 'RM 33,324',
//         'duration': '6 Semester / 3 Years',
//         'image': 'assets/images/electrical_course_1.jpg', // Add image path here
//       },
//       {
//         'title': 'Electrical Course 2',
//         'description': 'Advanced electrical engineering concepts.',
//         'programCode': 'R2/5234/0256',
//         'studyMode': 'Full Time',
//         'fee': 'RM 35,000',
//         'duration': '7 Semester / 3.5 Years',
//         'image': 'assets/images/electrical_course_2.jpg', // Add image path here
//       },
//     ],
//     'Mechanical': [
//       {
//         'title': 'Mechanical Course 1',
//         'description': 'Introduction to mechanics and dynamics.',
//         'programCode': 'R2/4256/0245',
//         'studyMode': 'Full Time',
//         'fee': 'RM 32,000',
//         'duration': '6 Semester / 3 Years',
//         'image': 'assets/images/mechanical_course_1.jpg', // Add image path here
//       },
//     ],
//     'Computer': [
//       {
//         'title': 'Computer Course 1',
//         'description': 'Introduction to programming and algorithms.',
//         'programCode': 'R2/3567/0245',
//         'studyMode': 'Full Time',
//         'fee': 'RM 30,000',
//         'duration': '6 Semester / 3 Years',
//         'image': 'assets/images/computer_course_1.jpg', // Add image path here
//       },
//     ],
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: DropdownButton<String>(
//             value: selectedCategory,
//             onChanged: (String? newValue) {
//               setState(() {
//                 selectedCategory = newValue!;
//               });
//             },
//             items: ['Electrical', 'Mechanical', 'Computer']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: courses[selectedCategory]!.length,
//             itemBuilder: (context, index) {
//               final course = courses[selectedCategory]![index];
//               return CourseCard(
//                 title: course['title']!,
//                 description: course['description']!,
//                 programCode: course['programCode']!,
//                 studyMode: course['studyMode']!,
//                 fee: course['fee']!,
//                 duration: course['duration']!, image: '',
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CourseCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String programCode;
//   final String studyMode;
//   final String fee;
//   final String duration;
//   final String image; // Add image field

//   const CourseCard({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.programCode,
//     required this.studyMode,
//     required this.fee,
//     required this.duration,
//     required this.image, // Add image parameter
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(12.0),
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image section (dynamically load the image)
//           Container(
//             height: 150.0,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(12.0),
//                 topRight: Radius.circular(12.0),
//               ),
//               image: DecorationImage(
//                 image: AssetImage(image), // Use the image passed dynamically
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8.0),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add your action here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         child: const Text('APPLY NOW'),
//                       ),
//                       const SizedBox(width: 10.0),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add your action here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                         child: const Text('READ MORE'),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12.0),
//                 Text(
//                   'Programme Code: $programCode',
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4.0),
//                 const Text('Status: Accredited'),
//                 Text('Study Mode: $studyMode'),
//                 Text('Fee: $fee'),
//                 Text('Duration: $duration'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




                  // Row with three buttons: Diploma, GAPP, GUFP
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           courseController.updateCourseContent(
                  //             Course(
                  //               title: 'MECHATRONICS',
                  //               description:
                  //                   'Programme Code:\n(R2/523/4/0245)\n(MQA/FA 14611)',
                  //               imagePath:
                  //                   'asset/images/Mechatronics-PLC-9-3.webp', // Path to your image
                  //               fee: 'RM 33,324',
                  //               duration: '6 Semester / 3 Years',
                  //             ),
                  //           );
                  //         },
                  //         child: const Text('Diploma'),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           courseController.updateCourseContent(
                  //             Course(
                  //               title: 'GAPP',
                  //               description: 'GAPP details go here.',
                  //               imagePath:
                  //                   'assets/images/gapp.jpg', // Path to your image
                  //               fee: 'RM 25,000',
                  //               duration: '5 Semester / 2.5 Years',
                  //             ),
                  //           );
                  //         },
                  //         child: const Text('GAPP'),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           courseController.updateCourseContent(
                  //             Course(
                  //               title: 'GUFP',
                  //               description: 'GUFP details go here.',
                  //               imagePath:
                  //                   'assets/images/gufp.jpg', // Path to your image
                  //               fee: 'RM 30,000',
                  //               duration: '4 Semester / 2 Years',
                  //             ),
                  //           );
                  //         },
                  //         child: const Text('GUFP'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //     height: 20), // Adding some space between the row and content

                  // // Displaying course details
                  // Obx(() {
                  //   final course = courseController.selectedCourse.value;

                  //   return Card(
                  //     color: Colors.blue[100],
                  //     margin: const EdgeInsets.all(16.0),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           // Course image
                  //           Image.asset(course.imagePath,
                  //               height: 200,
                  //               width: double.infinity,
                  //               fit: BoxFit.cover),
                  //           const SizedBox(height: 10),
                  //           // Course title
                  //           Text(
                  //             course.title,
                  //             style: const TextStyle(
                  //                 fontSize: 24, fontWeight: FontWeight.bold),
                  //           ),
                  //           const SizedBox(height: 10),
                  //           // Course description
                  //           Text(
                  //             course.description,
                  //             style: const TextStyle(fontSize: 16),
                  //           ),
                  //           const SizedBox(height: 10),
                  //           // Course fee and duration
                  //           Text(
                  //             'Fee: ${course.fee}',
                  //             style: const TextStyle(fontSize: 16),
                  //           ),
                  //           Text(
                  //             'Duration: ${course.duration}',
                  //             style: const TextStyle(fontSize: 16),
                  //           ),
                  //           const SizedBox(height: 20),
                  //           // Action buttons
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               ElevatedButton(
                  //                 onPressed: () {
                  //                   // Action for Apply Now button
                  //                 },
                  //                 child: const Text('APPLY NOW'),
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () {
                  //                   // Action for Read More button
                  //                 },
                  //                 child: const Text('READ MORE'),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // }),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
