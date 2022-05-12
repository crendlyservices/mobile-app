import 'package:crendly/views/main_screens/home/bank_transfer.dart';
import 'package:crendly/views/main_screens/home/card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../style/style.dart';
import '../../../widgets/custom_elevated_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        key: _scaffoldKey,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: More(),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 42),
                  width: 390,
                  height: 344,
                  decoration: BoxDecoration(
                      color: const Color(0xff081952),
                      border: Border.all(
                        color: const Color(0xff081952),
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(right: 16),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/images/orange.svg',
                                height: 27,
                                width: 27,
                              ),
                            ),
                          ),
                          const Text(
                            'Hi, Damilare',
                            style: TextStyle(
                                color: Color(0xffFED0B7),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'KumbhSans'),
                          ),
                          const SizedBox(
                            width: 124,
                          ),
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 21,
                          ),
                          const Icon(
                            Icons.notification_important,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 52,
                      ),
                      const Center(
                        child: Text(
                          'N35,000.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'KumbhSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ),
                      const SizedBox(
                        height: 53,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      enableDrag: false,
                                      isDismissible: false,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        int currentIndex = 0;
                                        return StatefulBuilder(
                                            builder:
                                                (context, setState) =>
                                                    DraggableScrollableSheet(
                                                      initialChildSize: 0.7,
                                                      builder: (_,
                                                              controller) =>
                                                          DefaultTabController(
                                                        initialIndex:
                                                            currentIndex,
                                                        length: 2,
                                                        child: ListView(
                                                          children: [
                                                            Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      22,
                                                                  vertical: 28),
                                                              color:
                                                                  backgroundColor,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Text(
                                                                        'Topup wallet',
                                                                        style:
                                                                            subtitle,
                                                                      ),
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.cancel_outlined,
                                                                            color:
                                                                                iconColor,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 35,
                                                                  ),
                                                                  const Text(
                                                                    'How much do you want to fund',
                                                                    style:
                                                                        smallText,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 13,
                                                                  ),
                                                                  TextField(
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xff797979),
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'KumbhSans',
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                        enabledBorder: inputBorder,
                                                                        hintStyle: const TextStyle(
                                                                          color:
                                                                              Color(0xff797979),
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              'KumbhSans',
                                                                        ),
                                                                        hintText: 'Enter amount',
                                                                        contentPadding: const EdgeInsets.all(8)),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 43,
                                                                  ),
                                                                  const Text(
                                                                    'Fund your wallet using',
                                                                    style:
                                                                        smallText,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              const Color(0xffFED0B7)),
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              6)),
                                                                    ),
                                                                    height: 39,
                                                                    child: TabBar(
                                                                        onTap: (int index) {
                                                                          setState(
                                                                              () {
                                                                            currentIndex =
                                                                                index;
                                                                          });
                                                                        },
                                                                        labelColor: const Color(0xff00071F),
                                                                        unselectedLabelColor: Colors.white,
                                                                        labelStyle: const TextStyle(fontFamily: 'KumbhSans', fontWeight: FontWeight.bold),
                                                                        unselectedLabelStyle: const TextStyle(
                                                                          fontFamily:
                                                                              'KumbhSans',
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                        indicator: BoxDecoration(
                                                                            color: const Color(0xffFED0B7),
                                                                            borderRadius: const BorderRadius.all(Radius.circular(6)),
                                                                            border: Border.all(
                                                                              color: const Color(0xffFED0B7),
                                                                            )),
                                                                        tabs: const [
                                                                          Text(
                                                                            'Card',
                                                                          ),
                                                                          Text(
                                                                            'Bank Transfer',
                                                                          ),
                                                                        ]),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 25,
                                                                  ),
                                                                  getViewTabBar(
                                                                      currentIndex)
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ));
                                      });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  child: const CircleAvatar(
                                    backgroundColor: Color(0xff4700E0),
                                    radius: 28,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Top up',
                                style: smallText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xff4700E0),
                                  radius: 28,
                                  child: Icon(
                                    Icons.print_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Withdraw',
                                style: smallText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: InkWell(
                                  onTap: () {
                                    // Scaffold.of(context).openEndDrawer();
                                    _scaffoldKey.currentState?.openEndDrawer();
                                    //ScaffoldState.openEndDrawer();
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Color(0xff4700E0),
                                    radius: 28,
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'More',
                                style: smallText,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1st Container
                          Container(
                            padding: const EdgeInsets.only(
                                top: 23, left: 16, right: 16),
                            width: 350,
                            height: 246,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xff63BEDB),
                                      Color(0xff56E77E),
                                      Color(0xff6DE7B4),
                                      Color(0xffE2FCC2),
                                    ]),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 44,
                                      height: 44,
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: const [
                                              CircularProgressIndicator(
                                                value: 0.25,
                                                backgroundColor:
                                                    Color(0xffADD4BE),
                                                color: Color(0xffFF0062),
                                              ),
                                              Positioned(
                                                top: 7,
                                                left: 4,
                                                child: Text('25%'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Credit Score',
                                      style: TextStyle(
                                          fontFamily: 'KumbhSans',
                                          fontSize: 10,
                                          color: Color(0xff070647)),
                                    ),
                                    const SizedBox(width: 38),
                                    Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              '25',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff070647)),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              'Loans',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'KumbhSans',
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SizedBox(
                                                width: 21,
                                                child: Divider(
                                                  height: 3,
                                                  thickness: 3,
                                                  color: Color(0xffFED0B7),
                                                )),
                                            SizedBox(width: 6),
                                            Text(
                                              'Taken',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 34),
                                    Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              '24',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff070647)),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              'Loans',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'KumbhSans',
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SizedBox(
                                                width: 21,
                                                child: Divider(
                                                  height: 3,
                                                  thickness: 3,
                                                  color: Color(0xff4700E0),
                                                )),
                                            SizedBox(width: 6),
                                            Text(
                                              'Repaid',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 42,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Current Loan',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'KumbhSans'),
                                          ),
                                          Text(
                                            'N-50,000.00',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 46,
                                        child: VerticalDivider(
                                          color: Colors.red,
                                        ),
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Loan Limit',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'KumbhSans'),
                                          ),
                                          Text(
                                            'N1,050,000.00',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 31,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      width: 128,
                                      height: 48,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Group 12960.svg'),
                                          const Text('Take Loan')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      width: 128,
                                      height: 48,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/repaid_loan.svg'),
                                          const Text('Take Loan')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 37,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 23, left: 16, right: 16),
                            width: 350,
                            height: 246,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xffFD5454),
                                      Color(0xffFF9061),
                                      Color(0xffFFBA7B),
                                      Color(0xffFFCEC3),
                                    ]),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 44,
                                      height: 44,
                                      child: Stack(
                                        children: const [
                                          CircularProgressIndicator(
                                            value: 0.69,
                                            backgroundColor: Color(0xffD3A48B),
                                            color: Color(0xff56E77E),
                                          ),
                                          Positioned(
                                            top: 7,
                                            left: 4,
                                            child: Text('69%'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text('Reputation',
                                        style: TextStyle(
                                            fontFamily: 'KumbhSans',
                                            fontSize: 10,
                                            color: Color(0xff070647))),
                                    const SizedBox(width: 30),
                                    Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              '65',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff070647)),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              'Loans',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'KumbhSans',
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SizedBox(
                                                width: 21,
                                                child: Divider(
                                                  height: 3,
                                                  thickness: 3,
                                                  color: Color(0xffFF0062),
                                                )),
                                            SizedBox(width: 6),
                                            Text(
                                              'Disbursed',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              '24',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff070647)),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              'Loans',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'KumbhSans',
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            SizedBox(
                                                width: 21,
                                                child: Divider(
                                                  height: 3,
                                                  thickness: 3,
                                                  color: Color(0xff4700E0),
                                                )),
                                            SizedBox(width: 6),
                                            Text(
                                              'Collected',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'KumbhSans',
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff070647)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 42,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Running Portfolio',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'KumbhSans'),
                                          ),
                                          Text(
                                            'N500,000.00',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 46,
                                        child: VerticalDivider(
                                          color: Colors.red,
                                        ),
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Total Loan Disbursed',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'KumbhSans'),
                                          ),
                                          Text(
                                            'N3,050,000.00',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 31,
                                ),
                                // TODO: change Icons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      width: 128,
                                      height: 48,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Group 12960.svg'),
                                          const Text('Take Loan')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      width: 128,
                                      height: 48,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/repaid_loan.svg'),
                                          const Text('Take Loan')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 37,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 58,
                          ),
                          const Text(
                            'Browse Our Loan Category',
                            style: boldSubtitle,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/Rectangle 19483.png'),
                                    Positioned(
                                        bottom: 28,
                                        left: 13,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                                width: 153,
                                                child: Text(
                                                  'Quick Loans to take care of your needs',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'KumbhSans',
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )),
                                            const SizedBox(
                                              height: 22,
                                            ),
                                            InkWell(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 60),
                                                width: 87,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.white)),
                                                child: const Center(
                                                    child: Text('View all')),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                        'assets/images/Rectangle 19483.png'),
                                    Positioned(
                                        bottom: 28,
                                        left: 13,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                                width: 153,
                                                child: Text(
                                                  'Quick Loans to take care of your needs',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'KumbhSans',
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )),
                                            const SizedBox(
                                              height: 22,
                                            ),
                                            InkWell(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 60),
                                                width: 87,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.white)),
                                                child: const Center(
                                                    child: Text('View all')),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 43,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white, border: Border.all()),
                            width: 350,
                            height: 141,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 13),
                                  child: Column(children: [
                                    const SizedBox(
                                      width: 186,
                                      height: 42,
                                      child: Text('Advert board'),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 50, top: 20),
                                      width: 126,
                                      child: CustomELevatedButton(
                                          text: 'Learn more', onPressed: () {}),
                                    )
                                  ]),
                                ),
                                SvgPicture.asset(
                                  'assets/images/Layer 2.svg',
                                  color: const Color(0xff6DE7B4),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text('Inside Crendly Community'),
                          Stack(
                            children: [
                              Image.asset('assets/images/Rectangle 864.png'),
                              Positioned(
                                  top: 23,
                                  left: 13,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                          width: 153,
                                          child: Text(
                                            'Looking for ways to cut your monthly spend?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                      const SizedBox(
                                        height: 33,
                                      ),
                                      InkWell(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 60),
                                          width: 87,
                                          height: 36,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: const Center(
                                              child: Text(
                                            'Stories',
                                            style: TextStyle(
                                                fontFamily: 'KumbhSans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 117,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Group 12920.svg'),
                                          SvgPicture.asset(
                                              'assets/images/Group 12920.svg'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            '40 people viewed this',
                                            style: boldSmallText,
                                          ),
                                          SizedBox(width: 120),
                                          Icon(
                                            Icons.share,
                                            color: Colors.white,
                                            size: 23,
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Stack(
                            children: [
                              Image.asset('assets/images/Rectangle 864.png'),
                              Positioned(
                                  top: 23,
                                  left: 13,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                          width: 153,
                                          child: Text(
                                            'Looking for ways to cut your monthly spend?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                      const SizedBox(
                                        height: 33,
                                      ),
                                      InkWell(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 60),
                                          width: 87,
                                          height: 36,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: const Center(
                                              child: Text(
                                            'Stories',
                                            style: TextStyle(
                                                fontFamily: 'KumbhSans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 117,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Group 12920.svg'),
                                          SvgPicture.asset(
                                              'assets/images/Group 12920.svg'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            '40 people viewed this',
                                            style: boldSmallText,
                                          ),
                                          SizedBox(width: 120),
                                          Icon(
                                            Icons.share,
                                            color: Colors.white,
                                            size: 23,
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // TODO: change picture
                          Stack(
                            children: [
                              Image.asset('assets/images/Rectangle 864.png'),
                              Positioned(
                                  top: 23,
                                  left: 13,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                          width: 153,
                                          child: Text(
                                            'Looking for ways to cut your monthly spend?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'KumbhSans',
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                      const SizedBox(
                                        height: 33,
                                      ),
                                      InkWell(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 60),
                                          width: 87,
                                          height: 36,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: const Center(
                                              child: Text(
                                            'Stories',
                                            style: TextStyle(
                                                fontFamily: 'KumbhSans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 117,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/Group 12920.svg'),
                                          SvgPicture.asset(
                                              'assets/images/Group 12920.svg'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            '40 people viewed this',
                                            style: boldSmallText,
                                          ),
                                          SizedBox(width: 120),
                                          Icon(
                                            Icons.share,
                                            color: Colors.white,
                                            size: 23,
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget More() {
    return Container(
      color: backgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Others',
                  style: boldSubtitle,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: iconColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 155,
              child: DottedBorder(
                color: const Color(0xff2E4DBD),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            margin: const EdgeInsets.only(right: 16),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/images/orange.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                'Damilare Martins',
                                style: boldSmallText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 206,
                                child: LinearProgressIndicator(
                                  backgroundColor: Color(0xff040F35),
                                  value: 80,
                                  color: colorLinearProgress,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Your profile is 80% complete',
                                style: regularFont,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Complete your profile',
                        style: skipText,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 42),
            Row(
              children: [
                Row(
                  children: const [
                    Text(
                      'Quick Menu',
                      style: regularFont,
                    ),
                    SizedBox(width: 3),
                    SizedBox(
                      width: 227,
                      child: Divider(
                        color: Color(0xff2E4DBD),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff4700E0),
                      border: Border.all(
                        color: const Color(0xff4700E0),
                      )),
                  height: 92,
                  width: 90,
                  child: Column(
                    children: const [
                      SizedBox(
                        width: 39,
                        height: 39,
                        child: CircleAvatar(
                            backgroundColor: Color(0xff6219FF),
                            radius: 25,
                            child: Icon(Icons.calculate_outlined)),
                      ),
                      SizedBox(height:7),
                      Text(
                        'Calculator',
                        style: regularFont,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getViewTabBar(int index) {
    switch (index) {
      case 0:
        return const BankCard();
      case 1:
        return const BankTransfer();
      default:
        return const BankCard();
    }
  }
}
