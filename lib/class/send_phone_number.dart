import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';

Future<void> SendPhoneNumber(
  BuildContext context,
  String mainIpAddress,
  String cellNumber,
  String platformVersion,
) async {
  final url = Uri.parse('https://s1.lianerp.com/api/public/auth/otp/send');
  // final url = Uri.parse('https://s1.lianerp.com/api/public/auth/otp/verify');

  final headers = {
    'TokenPublic': 'bpbm',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'ip': mainIpAddress,
    'phone_number': cellNumber,
    'userAgent': platformVersion,
    // 'code': 18395,
  });

  try {
    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    print('cellNumber');
    print(cellNumber);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // setState(() {
      //   mainOtpCode = data['otp'];
      // });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Failed to send phone number with ${response.statusCode}'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: $e'),
      ),
    );
  }
}
