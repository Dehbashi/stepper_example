import 'package:flutter/material.dart';
import './price_box.dart';
import './time_date.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../class/button_widget.dart';

class TimeDatePage extends StatefulWidget {
  const TimeDatePage({super.key});

  @override
  State<TimeDatePage> createState() => _TimeDatePageState();
}

class _TimeDatePageState extends State<TimeDatePage> {
  SharedPreferences? _prefs;
  String? selectedTime;

  // @override
  // void initState() {
  //   super.initState();
  //   loadSelectedTime();
  // }

  // Future<void> loadSelectedTime() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedTime = _prefs!.getString('selectedTime');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print('Build method called');
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            PriceBox(price: 0),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'انتخاب زمان سرویس',
                    style: TextStyle(
                      color: Color(0xFF037E85),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'دوست دارید چه زمانی کارشناس بسپارش به شما مراجعه کنه؟',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF037E85),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TimeDate(),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFFFA14A),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'زمان انتخاب شده شما:',
                    style: TextStyle(
                      color: Color(0xFFFFA14A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'امروز ${selectedTime ?? ''}',
                    style: TextStyle(
                      color: Color(0xFFFFA14A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // ButtonWidget(),
            // SizedBox(
            //   width: double.infinity,
            //   height: 300,
            // ),
          ],
        ),
      ),
    );
  }
}
