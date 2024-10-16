import 'package:flutter/material.dart';

class RadioButtonQuestionSPM extends StatelessWidget {
  const RadioButtonQuestionSPM({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged; // Correct type for onChanged

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14), // Smaller font size for radio button text
      ),
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: (String? newValue) {
          if (newValue != null) {
            onChanged(newValue); // Correct usage of onChanged function
          }
        },
      ),
    );
  }
}
