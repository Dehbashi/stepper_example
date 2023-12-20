import 'package:flutter/material.dart';
import 'screen/footer.dart';
import 'screen/header.dart';
import 'screen/calculator_page.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  final double _iconsize = 55;

  final double _iconspace = 95;

  final double _fontsize = 13;

  final double textboxwidth = 90;

  final double textboxheight = 40;

  final Map<Image, String> images1 = {
    Image.asset('assets/icons/homeicons/nasbekoolerabi.png'):
        'نصب و سرویس کولر آبی',
    Image.asset('assets/icons/homeicons/nasbeanten.png'):
        'نصب آنتن و آنتن مرکزی',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF037E85),
          unselectedItemColor: Color(0xFF037E85),
          selectedLabelStyle: TextStyle(
              // fontFamily: 'iranSans.ttf',
              ),
          unselectedLabelStyle: TextStyle(
              // fontFamily: 'iranSans.ttf',
              ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Stepper example',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 2,
                  direction: Axis.horizontal,
                  textDirection: TextDirection.rtl,
                  children: List<Widget>.generate(images1.length, (index) {
                    final image = images1.keys.toList()[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalculatorPage(
                                  serviceTitle: images1[image]!,
                                )),
                      ),
                      child: Container(
                        width: _iconspace,
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(
                              width: _iconsize,
                              height: _iconsize,
                              child: image,
                            ),
                            SizedBox(
                              width: 90,
                              height: 40,
                              child: Text(
                                images1[image]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: _fontsize,
                                  color: Color(0xFF037E85),
                                  fontFamily: 'iransans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
