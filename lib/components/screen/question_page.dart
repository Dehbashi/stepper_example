import 'package:flutter/material.dart';
import 'package:stepper_example/components/questions/Question.dart';
import 'package:stepper_example/components/screen/price_box.dart';
import '../questions/question_koolerabi.dart' show QuestionKoolerAbi;
import '../questions/question_nasbeanten.dart' show QuestionNasbeAnten;
import './price_box.dart';

class QuestionPage extends StatefulWidget {
  // const QuestionPage({super.key});

  final String serviceTitle;

  QuestionPage({required this.serviceTitle});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final QuestionKoolerAbi questionKoolerAbi = QuestionKoolerAbi();
  final QuestionNasbeAnten questionNasbeAnten = QuestionNasbeAnten();

  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    final String serviceTitle = widget.serviceTitle;
    // late List<dynamic> questionItems;
    late List<Question> questionItems;

    switch (serviceTitle) {
      case 'نصب و سرویس کولر آبی':
        questionItems = questionKoolerAbi.questions;

        break;
      // case 'نصب آنتن و آنتن مرکزی':
      //   questionItems = questionNasbeAnten.Questionnaire;
      //   break;
      default:
        questionItems = [];
        break;
    }

    Question currentQuestionModel = questionItems[currentQuestionIndex];
    final String currentQuestion = currentQuestionModel.question;
    final String currentQuestionType = currentQuestionModel.type;
    final List<String> currentAnswers = currentQuestionModel.answers;

    // final String currentQuestion =
    //     questionItems[currentQuestionIndex]['question'];
    // final String currentQuestionType =
    //     questionItems[currentQuestionIndex]['type'];
    // final List<String> currentAnswers =
    //     questionItems[currentQuestionIndex]['answers'];

    final isLastQuestion = currentQuestionIndex == questionItems.length - 1;
    final isFirstQuestion = currentQuestionIndex == 0;

    return Container(
      padding: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              'لطفاً مراحل ثبت پرسشنامه رو به دقت دنبال کنید',
              style: TextStyle(
                color: Color(0xFF04A8B2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'iranSans',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: 35,
            padding: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Color(0xFFCDEEF0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text(
                    serviceTitle,
                    style: TextStyle(
                      color: Color(0xFF037E85),
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    textDirection: TextDirection.ltr,
                    color: Color(0xFF037E85),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            currentQuestion,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'iranSans',
              color: Color(0xFF04A8B2),
            ),
          ),
          SizedBox(height: 8),
          if (currentQuestionType == 'radio')
            Scrollbar(
              thumbVisibility: true,
              radius: Radius.circular(5),
              child: Container(
                height: 300,
                child: ListView.builder(
                  physics:
                      AlwaysScrollableScrollPhysics(), // Disable scrolling of the inner ListView
                  shrinkWrap: true,
                  itemCount: currentAnswers.length,
                  itemBuilder: (context, answerIndex) {
                    return RadioListTile<int>(
                      title: Text(
                        currentAnswers[answerIndex],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'iranSans',
                          color: Color(0xFF04A8B2),
                        ),
                      ),
                      value: answerIndex,
                      groupValue: selectedAnswerIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswerIndex = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          if (currentQuestionType == 'textfield')
            Wrap(
              spacing: 20, // horizontal spacing between text fields
              runSpacing: 8.0, // vertical spacing between text fields
              children: currentAnswers.map((answer) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 -
                      30, // width of each text field
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelText: answer,
                      labelStyle: TextStyle(
                        fontSize: 13,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 239, 237, 237),
                    ),
                    onChanged: (value) {
                      // Handle the text field value change
                      // You can store the value in a variable or use it as needed
                    },
                  ),
                );
              }).toList(),
            ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'سوال قبل',
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  onPressed: isFirstQuestion
                      ? null
                      : () {
                          setState(() {
                            currentQuestionIndex--;
                            selectedAnswerIndex =
                                null; // Reset selected answer for the previous question
                          });
                        },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Tooltip(
                message: 'سوال بعد',
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF04A8B2),
                    ),
                  ),
                  onPressed: isLastQuestion
                      ? null
                      : () {
                          setState(() {
                            currentQuestionIndex++;
                            selectedAnswerIndex =
                                null; // Reset selected answer for the next question
                          });
                        },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    textDirection: TextDirection.ltr,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: PriceBox(price: 0),
          ),
        ],
      ),
    );
  }
}
