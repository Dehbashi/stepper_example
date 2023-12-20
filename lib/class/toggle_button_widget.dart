import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({Key? key}) : super(key: key);

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  List<bool> isSelected = [true, false]; // Update isSelected list length
  final List<String> buttonLabels = [
    'صبح\nاز ساعت 08:00\nتا ساعت 13:00',
    'عصر\nاز ساعت 13:00\nتا ساعت 18:00'
  ];

  late SharedPreferences _prefs;
  String? selectedText;

  Future<void> saveSelectedTime(String selectedText) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTime', selectedText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: ToggleButtons(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              isSelected: isSelected,
              selectedColor: Colors.white,
              fillColor: Colors.transparent,
              renderBorder: false,
              borderRadius: BorderRadius.circular(10),
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    isSelected[buttonIndex] = (buttonIndex == index);
                    selectedText = buttonLabels[index];
                  }
                  saveSelectedTime(selectedText ?? '');
                  print('Your text is: $selectedText');
                });
              },
              children: List.generate(
                isSelected.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: isSelected[index]
                          ? Color(0xFF04A8B2)
                          : Color(
                              0xFF68CBD1), // Customize the background color of the unselected button
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        buttonLabels[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
