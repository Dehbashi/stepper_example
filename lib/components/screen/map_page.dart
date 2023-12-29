import 'package:flutter/material.dart';
import '../../class/map_widget.dart';
import './transportation_box.dart';
import './price_box.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            PriceBox(price: 0),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF04A8B2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_location,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'افزدون نشانی جدید',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TransportationBox(price: 0),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'موقعیت مکانی نقشه  را مشخص کنید',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF037E85),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MapWidget(),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'نشانی',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF037E85),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF037E85),
                        )),
                    child: TextField(
                      maxLines: null,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.transparent,
                        //   ),
                        // ),
                        hintText:
                            'تهران، کارگر شمالی، انتهای کوی فراز، کوچه یاس',
                        hintStyle: TextStyle(
                          color: Color(0xFF037E85),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF037E85),
                            )),
                        child: TextField(
                          // maxLines: null,
                          // minLines: 1,
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: Colors.transparent,
                            //   ),
                            // ),
                            hintText: 'پلاک ...',
                            hintStyle: TextStyle(
                              color: Color(0xFF037E85),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF037E85),
                            )),
                        child: TextField(
                          // maxLines: null,
                          // minLines: 1,
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: Colors.transparent,
                            //   ),
                            // ),
                            hintText: 'واحد ...',
                            hintStyle: TextStyle(
                              color: Color(0xFF037E85),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
