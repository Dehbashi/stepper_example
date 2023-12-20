import 'package:flutter/material.dart';
import './Question.dart';

class QuestionKoolerAbi {
  // final List<Map<String, dynamic>> questionnaire = [
  //   {
  //     "question": "خدمات مدنظرتون رو انتخاب کنین.",
  //     "type": "radio",
  //     "answers": [
  //       'سرویس سالیانه',
  //       'تعمیرات کولر (تعویض و تنظیم اجزا)',
  //       'نصب و راه اندازی کامل (بدون جابه جایی و غیره)',
  //       'نمیدانم',
  //     ],
  //     "condition": null,
  //   },
  //   {
  //     "question": "نوع سرویس کولر آبی رو مشخص کنین",
  //     "type": "radio",
  //     "answers": [
  //       'سرویس کامل کولر (شستشوی کولر، روغن کاری، تعویض پوشال، چک کردن برق و سایر اجزا کولر)',
  //       'سرویس جزئی',
  //       'سرویس کولر آبی صنعتی (7000 به بالا)',
  //     ],
  //     "condition": {
  //       "questionIndex": 0,
  //       "selectedAnswer": 'سرویس سالیانه',
  //       // "nexquestionIndex": 3,
  //     },
  //   },
  //   {
  //     "question": "تعداد کولرهای آبی که نیاز به سرویس دارن رو مشخص کنین",
  //     "type": "radio",
  //     "answers": [
  //       '۱ تا ۲ کولر آبی دارم',
  //       '۳ تا ۷ کولر آبی دارم',
  //       'بیشتر از ۷ تا کولر آبی دارم',
  //     ],
  //     "condition": {
  //       "questionIndex": 1,
  //       "selectedAnswer":
  //           'سرویس کامل کولر (شستشوی کولر، روغن کاری، تعویض پوشال، چک کردن برق و سایر اجزا کولر)',
  //       // "nexquestionIndex": 3,
  //     },
  //   },
  //   {
  //     "question": "برای سرویس کولر آبی نیاز به جنس هم دارین؟",
  //     "type": "radio",
  //     "answers": [
  //       'بله، نیاز به جنس دارم.',
  //       'خیر، نیاز به جنس ندارم.',
  //       'نمیدونم، به نظر کارشناس نیاز دارم.',
  //     ],
  //     "condition": {
  //       "questionIndex": 5,
  //       "selectedAnswer": 'تعویض اجزا',
  //     },
  //   },
  //   {
  //     "question": "کولرتون کی سرویس شده؟",
  //     "type": "radio",
  //     "answers": [
  //       'به تازگی سرویس شده',
  //       'به تازگی سرویس نشده',
  //       'نمیدونم نیاز به کارشناس دارم',
  //     ],
  //     "condition": {
  //       "questionIndex": 1,
  //       "selectedAnswer": 'سرویس جزئی',
  //     },
  //   },
  //   {
  //     "question": "برای کولر آبی نیاز به کدوم خدمات دارین؟",
  //     "type": "radio",
  //     "answers": [
  //       'تعویض اجزا',
  //       'تنظیم اجزا',
  //     ],
  //     "condition": {
  //       "questionIndex": 0,
  //       "selectedAnswer": 'تعمیرات کولر (تعویض و تنظیم اجزا)',
  //     },
  //   },
  //   {
  //     "question": "نیاز به تعویض کدوم بخش کولر آبی دارین؟",
  //     "type": "radio",
  //     "answers": [
  //       'تعویض کلید کولر',
  //       'تعویض پمپ',
  //       'تعویض تسمه',
  //       'تعویض کفی',
  //       'تعویض شناور',
  //       'تعویض موتور',
  //       'تعویض برزنت',
  //       'تعویض پروانه داخل حلزونی',
  //       'تعویض یاتاقان',
  //       'تعویض فلکه ( فولی پروانه )',
  //       'تعویض شفت',
  //     ],
  //     "condition": {
  //       "questionIndex": 3,
  //       "selectedAnswer": 'بله، نیاز به جنس دارم.',
  //     }
  //   },
  //   {
  //     "question": "کدوم اجزای کولر آبی نیاز به تنظیم دارن؟",
  //     "type": "radio",
  //     "answers": [
  //       'تنظیم تسمه (رگلاژ موتور کولر)',
  //       'تنظیم شناور',
  //     ],
  //     "condition": {
  //       "questionIndex": 5,
  //       "selectedAnswer": 'تنظیم اجزا',
  //     },
  //   },
  //   {
  //     "question": "چندتا کولر نیاز به نصب کامل دارن؟",
  //     "type": "radio",
  //     "answers": [
  //       'یک عدد',
  //       '2 الی 4 عدد',
  //       '5 عدد به بالا',
  //     ],
  //     "condition": {
  //       "questionIndex": 5,
  //       "selectedAnswer": 'تنظیم اجزا',
  //     },
  //   },
  //   {
  //     "question": "کولرتون کی سرویس شده؟",
  //     "type": "radio",
  //     "answers": [
  //       'به تازگی سرویس شده',
  //       'به تازگی سرویس نشده',
  //       'نمیدونم نیاز به کارشناس دارم',
  //     ],
  //     "condition": {
  //       "questionIndex": 1,
  //       "selectedAnswer": 'سرویس جزئی',
  //     },
  //   },
  //   {
  //     "question":
  //         "لطفا مشخص کنین توی هر موقعیت، چه تعداد کولر آبی نیاز به سرویس دارن؟",
  //     "type": "textfield",
  //     "answers": [
  //       'پشت بام (3500000 ریال)',
  //       'بالکن (4500000 ریال)',
  //     ],
  //     "condition": {
  //       "questionIndex": 3,
  //       "selectedAnswer": 'نمیدونم نیاز به کارشناس دارم',
  //     },
  //   },
  //   {
  //     "question": "برای چندتا کولر نیاز به خدمات داری؟",
  //     "type": "textfield",
  //     "answers": [
  //       'لطفاً تعداد رو در باکس رو به رو وارد کنید (1000000 ریال)',
  //     ],
  //     "condition": {
  //       "questionIndex": 13,
  //       "selectedAnswer": 'تنظیم تسمه (رگلاژ موتور کولر)',
  //     },
  //   },
  //   {
  //     "question": "نوع و تعداد کولر آبی را مشخص کنید",
  //     "type": "textfield",
  //     "answers": [
  //       '3500 تا 4500 (4000000 ریال)',
  //       '5000 تا 6500 (4000000 ریال)',
  //       '7000 (4000000 ریال)',
  //     ],
  //     "condition": {
  //       "questionIndex": 6,
  //       "selectedAnswer": 'تعویض کلید کولر',
  //     },
  //   },
  // ];

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
    ),
    Question(
      question: 'نوع سرویس کولر آبی رو مشخص کنین',
      answers: [
        'سرویس کامل کولر (شستشوی کولر، روغن کاری، تعویض پوشال، چک کردن برق و سایر اجزا کولر)',
        'سرویس جزئی',
        'سرویس کولر آبی صنعتی (7000 به بالا)',
      ],
      type: 'radio',
    ),
    Question(
      question: 'تعداد کولرهای آبی که نیاز به سرویس دارن رو مشخص کنین',
      answers: [
        '۱ تا ۲ کولر آبی دارم',
        '۳ تا ۷ کولر آبی دارم',
        'بیشتر از ۷ تا کولر آبی دارم',
      ],
      type: 'radio',
    ),
  ];

  int currentQuestionIndex = 0;
  late VoidCallback questionChangeCallback;

  Map<int, int> dependencyConditions = {
    0: 1, // If the first answer of the first question is selected, the next question will be the second question
    0: 2, // If the second answer of the first question is selected, the next question will be the third question
  };

  void setQuestionChangeCallback(VoidCallback callback) {
    this.questionChangeCallback = callback;
  }

  void nextQuestion(String answer) {
    if (currentQuestionIndex < questions.length - 1) {
      int nextQuestionIndex = dependencyConditions[currentQuestionIndex] ??
          currentQuestionIndex + 1;

      currentQuestionIndex = nextQuestionIndex;

      // Trigger the callback function to notify the external component about the question change
      questionChangeCallback.call();
    }
  }
}
