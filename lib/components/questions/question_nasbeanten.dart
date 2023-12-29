import 'package:flutter/material.dart';
import './Question.dart';

class QuestionNasbeAnten {
  List<Question> questions = [
    Question(
      question: 'در کدام یک از خدمات آنتن میتوانیم کمکتان کنیم؟',
      answers: [
        'آنتن مرکزی',
        'آنتن معمولی',
        'نمیدانم',
      ],
      type: 'radio',
      tag: 0,
    ),
    Question(
      question: 'در چه زمینه ای از آنتن مرکزی کمک نیاز دارید؟',
      answers: [
        'عیب یابی آنتن مرکزی',
        'نصب و راه اندازی آنتن مرکزی',
        'سیم کشی آنتن مرکزی (نیاز به بازدید حضوری متخصص)',
      ],
      type: 'radio',
      tag: 1,
    ),
    Question(
      question: 'مشکل خود را وارد کنید',
      answers: [
        'سیم آنتن خراب است',
        'آنتن خراب است',
      ],
      type: 'radio',
      tag: 2,
    ),
    Question(
      question: 'نوع سیم کشی خود را وارد کنید',
      answers: [
        'سیم کشی توکار دارم',
        'سیم کشی روکار دارم',
      ],
      type: 'radio',
      tag: 3,
    ),
    Question(
      question: 'آیا نیاز به سیم آنتن دارید؟',
      answers: [
        'بله نیاز به سیم آنتن دارم',
        'خیر نیاز به سیم آنتن ندارم',
      ],
      type: 'radio',
      tag: 4,
    ),
    Question(
      question: 'گزینه مورد نظر خود را وارد کنید',
      answers: [
        'عیب یابی',
        'سیم کشی ( نیاز به بازدید حضوری متخصص)',
        'نصب و راه اندازی',
      ],
      type: 'radio',
      tag: 5,
    ),
    Question(
      question: 'مشکل خود را انتخاب کنید',
      answers: [
        'آنتن ما خراب است',
        'سیم آنتن قطع است',
        'شبکه پرپر میزند (تِرَک تِرَک)',
        'آنتن ما قطع شده است (شبکه نداریم)',
        'آنتن ضعیف است (بعضی از شبکه ها قطع است)',
      ],
      type: 'radio',
      tag: 6,
    ),
    Question(
      question: 'آیا نیاز به سیم کشی دارید؟',
      answers: [
        'بله نیاز دارم(نیازمند به بازدید حضوری متخصص )',
        'خیر نیاز ندارم',
      ],
      type: 'radio',
      tag: 7,
    ),
    Question(
      question: 'متراژ سیم خود را تعیین کنید',
      answers: [
        'متراژ سیم کشی (اجرت و محصول) (21000 ریال)',
      ],
      type: 'texfield',
      tag: 8,
    ),
  ];

  int currentQuestionIndex = 0;
  late VoidCallback questionChangeCallback;
  List<int> questionHistory = [];

  Map<int, Map<int, int>> dependencyConditions = {
    0: {0: 1, 1: 2, 2: 3, 3: 8},
    1: {0: 3, 1: 2, 2: 5},
    2: {},
    3: {},
    4: {},
    5: {},
    6: {},
    7: {},
    8: {},
  };

  void nextQuestion(int selectedAnswerIndex) {
    if (currentQuestionIndex < questions.length - 1) {
      Map<int, int>? dependencyMap = dependencyConditions[currentQuestionIndex];

      print('Your dependencyMap is $dependencyMap');

      int nextQuestionIndex =
          dependencyMap?[selectedAnswerIndex] ?? currentQuestionIndex + 1;

      questionHistory.add(currentQuestionIndex);

      currentQuestionIndex = nextQuestionIndex!;

      print('Your nextQuestionIndex inside koolerabi is $nextQuestionIndex');
      print(
          'Your currentQuestionIndex inside koolerabi is $currentQuestionIndex');
    }
  }

  void previousQuestion() {
    if (questionHistory.isNotEmpty) {
      currentQuestionIndex = questionHistory.removeLast();
    }
  }
}
