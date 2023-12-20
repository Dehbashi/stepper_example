import 'package:flutter/material.dart';

class TransportationBox extends StatefulWidget {
  final double price;

  const TransportationBox({Key? key, required this.price}) : super(key: key);

  @override
  _TransportationBoxState createState() => _TransportationBoxState();
}

class _TransportationBoxState extends State<TransportationBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF06C98B),
          width: 3,
        ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color: Color(0xFFFFA14A),
      // ),
      width: double.infinity,
      height: 100,
      // color: Color(0xFFFFA14A),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.airport_shuttle,
              size: 32,
              color: Color(0xFF06C98B),
            ),
            Text(
              '500,000 ریال',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF06C98B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
