import 'package:get/get.dart';

class SPMController extends GetxController {
  // Observable variables for the radio button answers
  var mathScoreAnswer = ''.obs;
  var spmAnswer = ''.obs;
  var scienceScoreAnswer = ''.obs;
  var anyTechnicalSubject = ''.obs;
  var passEnglish = ''.obs;

  // Observable variable for the number input
  var subjectsAboveC = ''.obs; // Empty string initially

  // Update methods for radio buttons
  void updateMathScoreAnswer(String answer) {
    mathScoreAnswer.value = answer;
  }

  void updateSpmAnswer(String answer) {
    spmAnswer.value = answer;
  }

  void updateScienceScoreAnswer(String answer) {
    scienceScoreAnswer.value = answer;
  }

  void updateAnyTechnicalSubjectAnswer(String answer) {
    anyTechnicalSubject.value = answer;
  }

  void updatePassEnglishAnswer(String answer) {
    passEnglish.value = answer;
  }

  // Method to update the number of subjects above C
  void updateSubjectsAboveC(String number) {
    subjectsAboveC.value = number;
  }
}
