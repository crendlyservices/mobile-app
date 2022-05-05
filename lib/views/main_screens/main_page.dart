import 'package:crendly/style/style.dart';
import 'package:crendly/views/main_screens/Transactions/transactions.dart';
import 'package:crendly/views/main_screens/home/home.dart';
import 'package:crendly/views/main_screens/loans/loans_and_portfolio.dart';
import 'package:crendly/views/main_screens/profile/profile.dart';
import 'package:flutter/material.dart';

import 'explore.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int currentIndex = 0;

  final screens = [
    const HomeView(),
    const LoansAndPortfolioView(),
    const TransactionsView(),
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
