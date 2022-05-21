import 'package:crendly/views/main_screens/loans/portfolio_chart.dart';
import 'package:flutter/material.dart';

import '../../../style/style.dart';
import 'loans_chart.dart';

class LoansAndPortfolioView extends StatefulWidget {
  const LoansAndPortfolioView({Key? key}) : super(key: key);

  @override
  _LoansAndPortfolioViewState createState() => _LoansAndPortfolioViewState();
}

class _LoansAndPortfolioViewState extends State<LoansAndPortfolioView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, _) => DefaultTabController(
          initialIndex: currentIndex,
          length: 2,
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    getViewTabBar(currentIndex),
                    Positioned(
                      left: 93,
                      top: 100,
                      child: Container(
                        width: 210,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xff000926),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: TabBar(
                            onTap: (int index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white,
                            labelStyle: const TextStyle(
                                fontFamily: 'KumbhSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            unselectedLabelStyle: const TextStyle(
                              fontFamily: 'KumbhSans',
                              fontSize: 14,
                            ),
                            indicator: BoxDecoration(
                                color: const Color(0xff2E4DBD),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                border: Border.all(
                                  color: const Color(0xff000926),
                                )),
                            tabs: const [
                              Text(
                                'Loans',
                              ),
                              Text(
                                'Portfolio',
                              ),
                            ]),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          )),
    );
  }

  Widget getViewTabBar(int index) {
    switch (index) {
      case 0:
        return const LoansChartView();
      case 1:
        return const PortfolioChartView();
      default:
        return const LoansChartView();
    }
  }
}
