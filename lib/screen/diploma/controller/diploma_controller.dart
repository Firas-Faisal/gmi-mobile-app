import 'package:get/get.dart'; // Import GetX for state management and dependency injection.

class DiplomaController extends GetxController {
  // Reactive selected category using RxString, initially set to 'ELECTRICAL'.
  var selectedCategory = 'ELECTRICAL'.obs;

  // Courses data structure: a map where each key is a category,
  // and the value is a list of course details as maps.
  final Map<String, List<Map<String, String>>> courses = {
    'ELECTRICAL': [
      // List of courses under the ELECTRICAL category.
      {
        'title': 'MECHATRONICS', // Title of the course.
        'description': 'Basics of electrical systems.', // Course description.
        'programCode':
            '(R2/523/4/0245) (07/25) (MQA/FA 14611)', // Program code for accreditation.
        'studyMode':
            'Full Time', // Study mode indicating if the course is full-time.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration of the course.
        'image': 'asset/images/Mechatronics-PLC-9-3.webp',

        'readMoreUrl':
            'https://www.gmi.edu.my/electrical-engineering/mechatronics/',
      },
      {
        'title': 'ELECTRONICS & INFORMATION TECHNOLOGY', // Title of the course.
        'description':
            'Advanced electrical engineering concepts.', // Course description.
        'programCode':
            '(R2/523/4/0246) (07/25) (MQA/FA 14613)', // Program code for accreditation.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration of the course.
        'image': 'asset/images/eit.webp',

        'readMoreUrl':
            'https://www.gmi.edu.my/electrical-engineering/electric-information-technology/',
      },
      {
        'title':
            'SUSTAINABLE ENERGY & POWER DISTRIBUTION', // Title of the course.
        'description':
            'Advanced electrical engineering concepts.', // Course description.
        'programCode': '(R2/522/4/0017) (10/27) (MQA/FA 1410)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image':
            'asset/images/sustainable-energy-storage-and-distribution.webp',

        'readMoreUrl':
            'https://www.gmi.edu.my/electrical-engineering/sustainable-energy-power-distribution/',
      },
      {
        'title': 'PROCESS INSTRUMENTATION & CONTROL',

        'description':
            'Advanced electrical engineering concepts.', // Description.
        'programCode':
            '(R2/523/4/0244) (07/25) (MQA/FA 14612)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'readMoreUrl':
            'https://www.gmi.edu.my/electrical-engineering/process-instrumentation-control/',
        'image':
            'asset/images/PROCESS-INSTRUMENTATION-CONTROL.webp', // Image path.
      },
      {
        'title': 'AUTOTRONICS ENGINEERING TECHNOLOGY', // Title of the course.
        'readMoreUrl':
            'https://www.gmi.edu.my/electrical-engineering/autotronics-engineering-technology/',
        'description':
            'Advanced electrical engineering concepts.', // Description.
        'programCode':
            '(R2/0741/4/0009) (12/29) (MQA/FA 4936)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/auto.webp', // Image path.
      },
    ],
    'MECHANICAL': [
      // List of courses under the MECHANICAL category.
      {
        'title':
            'PRECISION TOOLING ENGINEERING TECHNOLOGY', // Title of the course.
        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/precision-tooling/',
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'programCode': '(R2/0714/4/0013) (10/25) (A 5005)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image':
            'asset/images/CONVENTIONAL-MILLING-13-1536x1024.webp', // Image path.
      },
      {
        'title': 'INDUSTRIAL DESIGN', // Title of the course.
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/industrial-design-2/',
        'programCode': '(R/521/4/0103) (02/25) (MQA/FA 4785)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/IDE-25-scaled.webp', // Image path.
      },
      {
        'title': 'INDUSTRIAL QUALITY ENGINEERING', // Title of the course.
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'programCode':
            '(R/0741/4/0001) (10/28) (MQA/FA 10032)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/industrial-quality-engineering/',
        'image': 'asset/images/CMM-1-1536x1025.webp', // Image path.
      },
      {
        'title': 'INNOVATIVE PRODUCT DESIGN', // Title of the course.
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'programCode': '(R2/0741/4/0006) (01/26) (A 7165)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/TDT-5-scaled.webp', // Image path.

        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/innovative-product-design/',
      },
      {
        'title': 'CNC PRECISION TECHNOLOGY', // Title of the course.
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'programCode':
            '(R3/521/4/0232) (12/27) (MQA/FA 14870)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/DMG-CNC-STUDENT-2-scaled.webp', // Image path.

        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/cnc-precision-technology/',
      },
      {
        'title': 'MACHINE TOOL MAINTENANCE', // Title of the course.
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'programCode':
            '(R2/0741/4/0008) (12/29) (MQA/FA 4786)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/MTM07_GMI.webp', // Image path.

        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/machine-tools-maintenance/',
      },
      {
        'title': 'MANUFACTURING SYSTEM', // Title of the course.
        'description':
            'Introduction to mechanics and dynamics.', // Description.
        'programCode':
            '(R2/521/4/0049) (02/28) (MQA/FA 14871)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 33,324', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'readMoreUrl':
            'https://www.gmi.edu.my/mechanical-engineering/manufacturing-system/',
        'image':
            'asset/images/Flexible-Manufacturing-System-4-1536x1025.webp', // Image path.
      },
    ],
    'COMPUTER': [
      // List of courses under the COMPUTER category.
      {
        'title': 'SOFTWARE ENGINEERING', // Title of the course.
        'readMoreUrl':
            'https://www.gmi.edu.my/computer-and-information/software-engineering/',
        'description':
            'Introduction to programming and algorithms.', // Description.
        'programCode': '(R/481/4/0803) (03/28) (MQA/FA 9541)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 30,000', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/SET-15-1536x1024.webp', // Image path.
      },
      {
        'title': 'CYBER SECURITY TECHNOLOGY', // Title of the course.
        'readMoreUrl':
            'https://www.gmi.edu.my/computer-and-information/cyber-security-technology/',
        'description':
            'Introduction to programming and algorithms.', // Description.
        'programCode':
            '(R2/0613/4/0043) (07/26) (MQA/FA 15748)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 30,000', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image':
            'asset/images/CYBER-BATTLEFIELD-9-1536x1025.webp', // Image path.
      },
      {
        'title': 'CREATIVE MULTIMEDIA', // Title of the course.
        'description':
            'Introduction to programming and algorithms.', // Description.
        'programCode': '(R/213/4/0272) (07/25) (MQA/FA 6035)', // Program code.
        'studyMode': 'Full Time', // Study mode.
        'fee': 'RM 30,000', // Course fee.
        'duration': '6 Semester / 3 Years', // Duration.
        'image': 'asset/images/CRM-6.webp', // Image path.

        'readMoreUrl':
            'https://www.gmi.edu.my/computer-and-information/creative-multimedia/',
      },
    ],
  };
}
