import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import './info.dart';
import './build_step_widget.dart';

class CalculatorPage extends StatefulWidget {
  // const QuestionPage({super.key});

  late final String serviceTitle;

  CalculatorPage({required this.serviceTitle});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    String serviceTitle = widget.serviceTitle;
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF037E85),
          unselectedItemColor: Color(0xFF037E85),
          selectedLabelStyle: TextStyle(
            fontFamily: 'iranSans',
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'iranSans',
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Stepper example',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: IconStepper(
                  activeStep: activeStep,
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                  icons: [
                    Icon(Icons.question_answer),
                    Icon(Icons.map_outlined),
                    Icon(Icons.lock_clock),
                    Icon(Icons.person),
                    Icon(Icons.home),
                    Icon(Icons.dashboard),
                  ],
                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.all(5),
              //   color: Colors.green,
              //   child: Text(
              //     info(activeStep),
              //     style: TextStyle(
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: buildStepWidget(activeStep, serviceTitle),
                ),
              ),
            ],
          ),
        ),
        // body: Container(
        //   margin: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       Container(
        //         width: double.infinity,
        //         padding: EdgeInsets.only(top: 20),
        //         alignment: Alignment.center,
        //         child: Text(
        //           'لطفاً مراحل ثبت پرسشنامه رو به دقت دنبال کنید',
        //           style: TextStyle(
        //             color: Color(0xFF04A8B2),
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold,
        //             fontFamily: 'iranSans',
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         alignment: Alignment.centerRight,
        //         width: double.infinity,
        //         height: 35,
        //         padding: EdgeInsets.only(right: 15),
        //         decoration: BoxDecoration(
        //           color: Color(0xFFCDEEF0),
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Row(
        //             children: [
        //               Text(
        //                 serviceTitle,
        //                 style: TextStyle(
        //                   color: Color(0xFF037E85),
        //                   fontSize: 16,
        //                   // fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               Icon(
        //                 Icons.arrow_back_ios_new_outlined,
        //                 textDirection: TextDirection.ltr,
        //                 color: Color(0xFF037E85),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Directionality(
        //         textDirection: TextDirection.rtl,
        //         child: QuestionPage(serviceTitle: serviceTitle),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
