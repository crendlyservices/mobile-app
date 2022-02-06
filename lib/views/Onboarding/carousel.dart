import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselStartPage extends StatelessWidget {
  const CarouselStartPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final List<String> imagesList = [
      'assets/images/la1.png',
      'assets/images/la2.png',
      'assets/images/la3.png',
      'assets/images/la4.png',

    ];
    return Scaffold(

      body: Container(
        color: Colors.black,
        child: Column(
          children: [

            CarouselSlider(
              options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  autoPlayInterval: Duration(milliseconds: 100)
              ),
              items: imagesList
                  .map(
                    (item) => Container(
                  child: Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      height: 500,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
