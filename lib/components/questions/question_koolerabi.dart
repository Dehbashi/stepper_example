import 'package:flutter/material.dart';
import './Question.dart';

class QuestionKoolerAbi {
  bool lastQuestion = false;
  List<Question> questions = [
    Question(
      question: 'خدمات مدنظرتون رو انتخاب کنین',
      answers: [
        'سرویس سالیانه',
        'تعمیرات کولر (تعویض و تنظیم اجزا)',
        'نصب و راه اندازی کامل (بدون جابه جایی و غیره)',
        'نمیدانم',
      ],
      type: 'radio',
      tag: 0,
    ),
    Question(
      question: 'نوع سرویس کولر آبی رو مشخص کنین',
      answers: [
        'سرویس کامل کولر (شستشوی کولر، روغن کاری، تعویض پوشال، چک کردن برق و سایر اجزا کولر)',
        'سرویس جزئی',
        'سرویس کولر آبی صنعتی (7000 به بالا)',
      ],
      type: 'radio',
      tag: 1,
    ),
    Question(
      question: 'تعداد کولرهای آبی که نیاز به سرویس دارن رو مشخص کنین',
      answers: [
        '۱ تا ۲ کولر آبی دارم',
        '۳ تا ۷ کولر آبی دارم',
        'بیشتر از ۷ تا کولر آبی دارم',
      ],
      type: 'radio',
      tag: 2,
    ),
    Question(
      question: 'برای سرویس کولر آبی نیاز به جنس هم دارین؟',
      answers: [
        'بله، نیاز به جنس دارم.',
        'خیر، نیاز به جنس ندارم.',
        'نمیدونم، به نظر کارشناس نیاز دارم.',
      ],
      type: 'radio',
      tag: 3,
    ),
    Question(
      question: 'کولرتون کی سرویس شده؟',
      answers: [
        'به تازگی سرویس شده',
        'به تازگی سرویس نشده',
        'نمیدونم نیاز به کارشناس دارم',
      ],
      type: 'radio',
      tag: 4,
    ),
    Question(
      question: 'برای کولر آبی نیاز به کدوم خدمات دارین؟',
      answers: [
        'تعویض اجزا',
        'تنظیم اجزا',
      ],
      type: 'radio',
      tag: 5,
    ),
    Question(
      question: 'نیاز به تعویض کدوم بخش کولر آبی دارین؟',
      answers: [
        'تعویض کلید کولر',
        'تعویض پمپ',
        'تعویض تسمه',
        'تعویض کفی',
        'تعویض شناور',
        'تعویض موتور',
        'تعویض برزنت',
        'تعویض پروانه داخل حلزونی',
        'تعویض یاتاقان',
        'تعویض فلکه ( فولی پروانه )',
        'تعویض شفت',
      ],
      type: 'radio',
      tag: 6,
    ),
    Question(
      question: 'کدوم اجزای کولر آبی نیاز به تنظیم دارن؟',
      answers: [
        'تنظیم تسمه (رگلاژ موتور کولر)',
        'تنظیم شناور',
      ],
      type: 'radio',
      tag: 7,
    ),
    Question(
      question: 'چندتا کولر نیاز به نصب کامل دارن؟',
      answers: [
        'یک عدد',
        '2 الی 4 عدد',
        '5 عدد به بالا',
      ],
      type: 'radio',
      tag: 8,
    ),
    Question(
      question:
          'لطفا مشخص کنین توی هر موقعیت، چه تعداد کولر آبی نیاز به سرویس دارن؟',
      answers: [
        'پشت بام (3,500,000 ریال)',
        'بالکن (3,400,000 ریال)',
      ],
      type: 'textfield',
      tag: 9,
    ),
    Question(
      question: 'برای چندتا کولر نیاز به خدمات داری؟',
      answers: [
        'لطفاً تعداد رو در باکس رو به رو وارد کنید (1000000 ریال)',
      ],
      type: 'textfield',
      tag: 10,
    ),
    Question(
      question: 'نوع و تعداد کولر آبی را مشخص کنید',
      answers: [
        '3500 تا 4500 (4000000 ریال)',
        '5000 تا 6500 (4000000 ریال)',
        '7000 (4000000 ریال)',
      ],
      type: 'textfield',
      tag: 11,
    ),
    Question(
      question: 'چندتا کولر نیاز به سرویس دارن؟',
      answers: [
        'لطفاً تعداد رو در باکس روبه رو وارد کنید (10,000,000 ریال)',
      ],
      type: 'textfield',
      tag: 12,
    ),
    Question(
      question:
          'لطفا مشخص کنین توی هر موقعیت، چه تعداد کولر آبی نیاز به سرویس دارن؟',
      answers: [
        'پشت بام (3,500,000 ریال)',
        'بالکن (3,400,000 ریال)',
      ],
      type: 'textfield',
      tag: 13,
    ),
    Question(
      question: 'لطفاً نوع و تعداد جنس هایی که نیاز دارین رو مشخص کنین',
      answers: [
        'پمپ آب (390000 ریال)',
        'تسمه (72000 ریال)',
        'شناور (96000 ریال)',
        'سبد (15000 ریال)',
        'زیر آب (10000 ریال)',
        'سه راهی آب (15000 ریال)',
        'شلنگ (واحد متر است) (10000 ریال)',
        'شیر آب کولر (60000 ریال)',
        'مهره ممگی (10000 ریال)',
        'کلید روکار (75000 ریال)',
        'کلید توکار (100000 ریال)',
        'بست دینام (10000 ریال)',
        'برزنت (60000 ریال)',
        'پوشال (120000 ریال)',
        'فولی (40000 ریال)',
        'فلکه (60000 ریال)',
        'یاتاقان (55000 ریال)',
      ],
      type: 'textfield',
      tag: 14,
    ),
  ];

  int currentQuestionIndex = 0;
  late VoidCallback questionChangeCallback;
  List<int> questionHistory = [];

  Map<int, Map<int, Map<int, bool>>> dependencyConditions = {
    0: {
      0: {1: false},
      1: {5: false},
      2: {8: false},
      3: {11: false},
    },
    1: {
      0: {2: false},
      1: {4: false},
      2: {12: false},
    },
    2: {
      0: {3: false},
      1: {3: false},
      3: {3: false},
    },
    3: {
      0: {9: false},
      1: {13: true},
      2: {13: true},
    },
    4: {},
    5: {},
    6: {},
    7: {},
    8: {},
    9: {
      1: {14: true}
    },
    10: {},
    11: {},
  };

  void nextQuestion(dynamic selectedAnswerIndex) {
    if (currentQuestionIndex < questions.length - 1) {
      Map<int, Map<int, bool>>? dependencyMap =
          dependencyConditions[currentQuestionIndex];

      print('Your dependencyMap is $dependencyMap');

      int? nextQuestionIndex;
      bool? lastQuestion;

      if (dependencyMap != null) {
        Map<int, bool>? nextQuestionMap = dependencyMap[selectedAnswerIndex];
        if (nextQuestionMap != null) {
          lastQuestion = nextQuestionMap.values.first;
          nextQuestionIndex = nextQuestionMap.keys.first;
        }
      }

      if (lastQuestion == true) {
        print('This is the last question');
        // Handle the last question case here
        
      } else {
        questionHistory.add(currentQuestionIndex);
        currentQuestionIndex = nextQuestionIndex ?? currentQuestionIndex + 1;
        print('Your nextQuestionIndex is $nextQuestionIndex');
      }

      print('Your currentQuestionIndex is $currentQuestionIndex');
    }
  }

  void previousQuestion() {
    if (questionHistory.isNotEmpty) {
      currentQuestionIndex =
          questionHistory.removeLast(); // Remove the last question from history
    }
  }
}
