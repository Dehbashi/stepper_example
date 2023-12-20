import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper_example/class/send_phone_number.dart';
import '../../class/verify_button.dart';
import '../../class/verify_otp.dart';
import 'dart:async';
import 'package:persian/persian.dart';

class OtpPage extends StatefulWidget {
  // const OtpPage({super.key});

  final String cellNumber;
  final String ip;
  final String userAgent;

  OtpPage({
    required this.cellNumber,
    required this.ip,
    required this.userAgent,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late String otpCode;
  late String cellNumber = widget.cellNumber;
  late String ip = widget.ip;
  late String userAgent = widget.userAgent;
  final _formKey = GlobalKey<FormState>();

  int countdownDuration = 90;
  Timer? timer;
  late String text = '';
  bool countdownFinished = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdownDuration > 0) {
          countdownDuration--;
          countdownFinished = false;
          text =
              'ارسال مجدد کد فعالسازی: ${countdownDuration.toString().withPersianNumbers()}';
        } else {
          timer.cancel();
          text = 'برای ارسال مجدد کد کلیک کنید';
          countdownFinished = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      height: 650,
      decoration: BoxDecoration(
        color: Color(0xFFCDEEF0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Icon(
              Icons.verified_user,
              size: 80,
              color: Color(0xFF037E85),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              'کد فعالسازی پیامک شده به شماره',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF025459),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              cellNumber.withPersianNumbers(),
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF037E85),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              'رو وارد کنید',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF025459),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: OtpTextField(
              numberOfFields: 5,
              filled: true,
              fillColor: Colors.white,
              borderRadius: BorderRadius.circular(7),
              fieldWidth: 50,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                otpCode = verificationCode;
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          VerifyButton(
            title: 'اعتبارسنجی کد فعالسازی',
            onPressed: () {
              print('Verification code is: $otpCode');
              verifyOtpCode(context, ip, cellNumber, userAgent, otpCode);
            },
            formkey: _formKey,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: InkWell(
              onTap: () {
                if (countdownFinished) {
                  SendPhoneNumber(context, ip, cellNumber, userAgent);
                  setState(() {
                    countdownFinished = false;
                    text = 'برای ارسال مجدد کد کلیک کنید';
                    print('clicked');
                  });
                }
              },
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF037E85),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
