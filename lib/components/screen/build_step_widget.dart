import 'package:flutter/material.dart';
import './question_page.dart';
import 'map_page.dart';
import 'time_date_page.dart';
import './user_page.dart';

Widget buildStepWidget(int activeStep, String serviceTitle) {
  switch (activeStep) {
    case 0:
      return QuestionPage(serviceTitle: serviceTitle);
    case 1:
      return MapPage();
    case 2:
      return TimeDatePage();
    case 3:
      return UserPage();
    default:
      return Container();
  }
}
