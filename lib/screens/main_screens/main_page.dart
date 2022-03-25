import 'package:crendly/screens/main_screens/Transactions/transactions.dart';
import 'package:crendly/screens/main_screens/home.dart';
import 'package:crendly/screens/main_screens/loans/myloans.dart';
import 'package:crendly/screens/main_screens/profile/profile.dart';
import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

import 'explore.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final screens = [
    const Home(),
    const MyLoans(),
    const Transactions(),
    const Explore(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color.fromRGBO(2, 18, 74, 1),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromRGBO(196, 196, 196, 1),
        selectedItemColor: const Color.fromRGBO(254, 208, 183, 1),
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.clean_hands_outlined), label: 'My Loans'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
