import 'package:flutter/material.dart';
import '../components/questions/question_koolerabi.dart';
import '../components/questions/question_nasbeanten.dart';

class ServiceSelection {
  static dynamic getQuestionService(String serviceTitle) {
    switch (serviceTitle) {
      case 'نصب و سرویس کولر آبی':
        return QuestionKoolerAbi();
      case 'نصب آنتن و آنتن مرکزی':
        return QuestionNasbeAnten();
      // Add more cases for other services if needed
      default:
        throw Exception('Unsupported service title: $serviceTitle');
    }
  }
}
