import 'package:flutter/material.dart';

class PriceBox extends StatefulWidget {
  final double price;

  const PriceBox({Key? key, required this.price}) : super(key: key);

  @override
  _PriceBoxState createState() => _PriceBoxState();
}

class _PriceBoxState extends State<PriceBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFFA14A),
      ),
      width: double.infinity,
      height: 100,
      // color: Color(0xFFFFA14A),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'هزینه محاسبه شده تا این لحظه:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '9,000,000 ریال',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              tooltip: 'پاکسازی',
              icon: Icon(
                Icons.refresh,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
