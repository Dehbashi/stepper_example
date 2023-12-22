import 'package:flutter/material.dart';
import '../../class/verify_button.dart';
import '../../class/text_field_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_ip_address/get_ip_address.dart';
import 'package:flutter/services.dart';
import '../../class/get_user_agent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../class/send_phone_number.dart';
import './otp_page.dart';
import './calculator_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late String cellNumber;
  final _formKey = GlobalKey<FormState>();
  late String mainOtpCode;
  late String mainIpAddress;
  late String userAgent;

  /// Code for fetching the user agent of the device
  ///
  Future<void> saveUserAgent() async {
    // late String? userAgent;
    try {
      userAgent = await GetUserAgent.getUserAgent();
    } on PlatformException catch (e) {
      print('Failed to get user agent: ${e.message}');
    }

    if (userAgent != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userAgent', userAgent);
    }

    setState(() {
      userAgent = userAgent!;
    });
  }

  /// Code for IP fetching
  ///
  void getIP() async {
    try {
      var ipAddress = IpAddress(type: RequestType.json);
      dynamic data = await ipAddress.getIpAddress();
      String ipAddressString = data['ip'];
      mainIpAddress = ipAddressString;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('ip', mainIpAddress);
    } on IpAddressException catch (exception) {
      print(exception.message);
    }
  }

  @override
  void initState() {
    super.initState();
    saveUserAgent();
    getIP();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      height: 560,
      decoration: BoxDecoration(
        color: Color(0xFFCDEEF0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset(
              'assets/images/logo.png',
              width: 250,
              height: 150,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phonelink_lock,
                  size: 24,
                  color: Color(0xFF037E85),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'شماره تلفن همراه تون رو وارد کنید',
                  style: TextStyle(
                    color: Color(0xFF025459),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: TextFieldWidget(
                    icon: Icons.refresh,
                    suffixIcon: null,
                    labelText: '09123456789',
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      cellNumber = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً شماره تلفن خود را وارد نمایید';
                      } else if (!value.startsWith('09')) {
                        return 'شماره تلفن باید با 09 آغاز شود';
                      } else if (value.length != 11) {
                        return 'شماره تلفن باید 11 رقمی باشد';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                VerifyButton(
                  title: 'ارسال کد فعالسازی',
                  formkey: _formKey,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      SendPhoneNumber(
                        context,
                        mainIpAddress,
                        cellNumber,
                        userAgent,
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              width: 400, // Set the desired width
                              // padding: EdgeInsets.all(16),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    OtpPage(
                                      cellNumber: cellNumber,
                                      ip: mainIpAddress,
                                      userAgent: userAgent,
                                    ),
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('تغییر شماره تلفن'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );

                      print('Your phone number is: $cellNumber');
                      print('Your IP Address is: $mainIpAddress');
                      print('Your User Agent is: $userAgent');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
