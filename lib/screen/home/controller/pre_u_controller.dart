import 'package:get/get.dart';

class PreUController extends GetxController {
  // Reactive selected category using RxString
  var selectedCategory = 'GAPP'.obs;

  // Courses data based on GAPP and GUFP programs
  final Map<String, List<Map<String, String>>> courses = {
    'GAPP': [
      {
        'program_brief':
            'Germany, renowned for its technological achievements, offers top-tier university degrees that are highly respected globally.',
        'admission_requirements':
            'SPM or equivalent with at least “A” for English, Mathematics, Additional Mathematics, Physics, and Chemistry for sponsored candidates.',
        'study_outline':
            '22-month preparatory program at GMI, followed by a 6-month intensive language training at German centers before UAS enrollment.',
        'fees':
            'Application & Study Fees: RM40,000 for 4 semesters. Subject to change. Sponsored by MARA YTP available.',
      }
    ],
    'GUFP': [
      {
        'program_brief':
            'The GUFP program offers preparatory courses for students looking to further their education in Germany\'s top universities.',
        'admission_requirements':
            'SPM or equivalent with a minimum “C” for English, Mathematics, Physics, and Chemistry for private candidates.',
        'study_outline':
            '13-week pre-study practical experience and German language training at various centers in Germany.',
        'fees':
            'Application & Study Fees: RM30,000 for 3 semesters. Self-finance options available.',
      }
    ],
  };
}
