import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../class/verify_button.dart';
import 'dart:async';
import '../../class/text_field_widget.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  late String otpCode;
  late String firstName;
  late String lastName;
  // late String cellNumber = widget.cellNumber;
  // late String ip = widget.ip;
  // late String userAgent = widget.userAgent;
  final _formKey = GlobalKey<FormState>();

  Future<void> SaveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
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
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 100, right: 10),
            child: Text(
              'مشخصات فردی',
              style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
                color: Color(0xFF037E85),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFieldWidget(
                    icon: null,
                    labelText: 'نام',
                    obscureText: false,
                    onSaved: (value) {
                      firstName = value ?? '';
                    },
                    suffixIcon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً نام خود را وارد نمایید';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFieldWidget(
                    icon: null,
                    labelText: 'نام خانوادگی',
                    obscureText: false,
                    onSaved: (value) {
                      lastName = value ?? '';
                    },
                    suffixIcon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفاً نام خانوادگی خود را وارد نمایید';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: VerifyButton(
                    title: 'ثبت نام',
                    formkey: _formKey,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        SaveName();
                      }
                      print(
                          'your first name is $firstName and your last name is $lastName');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
