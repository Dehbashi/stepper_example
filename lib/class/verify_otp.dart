import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> verifyOtpCode(
  BuildContext context,
  String ip,
  String cellNumber,
  String userAgent,
  String otpCode,
) async {
  final url = Uri.parse('https://s1.lianerp.com/api/public/auth/otp/verify');

  final headers = {
    'TokenPublic': 'bpbm',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'ip': ip,
    'phone_number': cellNumber,
    'userAgent': userAgent,
    'code': otpCode,
  });

  final response = await http.post(url, headers: headers, body: body);
  print(response.body);
  print(body);
  print('cellNumber');
  print(cellNumber);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final token = data['data']['token'];
    final id = data['data']['user']['id'];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('id', id);
    prefs.setString('cellNumber', cellNumber);
    prefs.setString('userAgent', userAgent);

    print('your data is $data');
    Navigator.of(context).pop();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => AdminPage(),
    //   ),
    // );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Failed to send phone number with ${response.statusCode}'),
      ),
    );
  }
}
