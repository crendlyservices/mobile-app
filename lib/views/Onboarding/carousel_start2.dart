import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List myList = [
  [
    'assets/images/la1.png',
    'A place for ',
    'Social Lending',
    'A platform where real people can learn money to real people'
  ],
  [
    'assets/images/la4.png',
    'We turn up ',
    'safety',
    'You worked hard for your money, Crendly makes it come back to you with more.'
  ],
  [
    'assets/images/la2.png',
    'You’re in ',
    'control',
    'Control your profit on what you lend out'
  ],
  [
    'assets/images/la3.png',
    'Ready? let’s go!',
    '',
    'Just a few details from you, to give you the best experience ever.'
  ]
];

class CarouselTwo extends StatefulWidget {
  const CarouselTwo({Key? key}) : super(key: key);

  @override
  _CarouselTwoState createState() => _CarouselTwoState();
}

class _CarouselTwoState extends State<CarouselTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CarouselSlider(
        options: CarouselOptions(height: 700, viewportFraction: 10),
        items: myList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: Column(
                    children: [
                      Image.asset(
                        i[0],
                        fit: BoxFit.fill,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            i[1],
                            style: TextStyle(fontSize: 27, color: Colors.white),
                          ),
                          Text(
                            i[2],
                            style: const TextStyle(
                                fontSize: 27, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(i[3],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center),
                      if (i[0] == 'assets/images/la3.png')
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Sign up'),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.teal[200],
                                  primary: Colors.white,
                                ),
                              ),
                              OutlinedButton(
                                child: const Text('Sign In'),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(
                                      color: Colors.teal, width: 1),
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  print('Pressed');
                                },
                              )
                            ],
                          )),
                        )
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
