import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import './info.dart';
import './build_step_widget.dart';
import '../../class/button_widget.dart';

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
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: buildStepWidget(activeStep, serviceTitle),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ButtonWidget(
                    onPressedNext: () {
                      setState(() {
                        activeStep += 1;
                      });
                    },
                    onPressedPrevious: () {
                      if (activeStep > 0) {
                        setState(() {
                          activeStep -= 1;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
