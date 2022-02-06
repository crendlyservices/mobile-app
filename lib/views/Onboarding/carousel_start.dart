import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselInto extends StatefulWidget {
  const CarouselInto({Key? key}) : super(key: key);

  @override
  _CarouselIntoState createState() => _CarouselIntoState();
}

class _CarouselIntoState extends State<CarouselInto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(height: 500),
        items: ['assets/la1.png','assets/la1.png,assets/la1.png,assets/la1.png']
            .map((i) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  Image.asset(i),
                  SizedBox(
                    height: 100,
                  ),
                  if (i == 'assets/la1.png')
                    Text(
                      "Welcome to page 1",
                      style: TextStyle(fontSize: 25),
                    ),
                  if (i == 'assets/la2.png') Text('Welcome to page 2'),
                  if (i == 'assets/la3.png') Text('Welcome to third screen'),
                  if (i == 'assets/la4.png') Text('welcome to final screen'),

                ],
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
