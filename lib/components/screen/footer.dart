import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  // const Footer({super.key});
  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  // Named parameter for menu click

  int _currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
      // Use Navigator to navigate to the desired pages
      switch (index) {
        case 0:
          // Navigate to the home page
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
          break;
        case 1:
          // Navigate to the contact page
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ContactUs()));
          break;
        case 2:
          // Navigate to the about page
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => AboutUs()));
          break;
        case 3:
          // Navigate to the support page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SupportPage()));
          break;
        case 4:
          // Navigate to the profile page
          // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.headset_mic), label: 'تماس با ما'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded), label: 'درباره ما'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'پشتیبانی'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'پروفایل'),
          ],
        ),
      ),
    );
  }
}
