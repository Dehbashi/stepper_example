import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  // const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFA14A),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.devicePixelRatioOf(context),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'بازگشت به مرحله قبل',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF04A8B2),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.devicePixelRatioOf(context),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'رفتن به مرحله بعد',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
