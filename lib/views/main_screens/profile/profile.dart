import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'my_account.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Profile',
                style: headerTextStyle,
              ),
              Image.asset('assets/images/Vector.png')
            ]),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 348,
              height: 182,
              child: Card(
                color: const Color.fromRGBO(8, 25, 82, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 59,
                            width: 59,
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/images/orange.svg',
                                height: 48,
                                width: 41,
                              ),
                            ),
                          ),
                          Column(
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 12.0, bottom: 8.0),
                                child: Text(
                                  'Danny Rand',
                                  style: subTextStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'FCMB - 21999B7626',
                                  style: subSmallTextStyle,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: Color.fromRGBO(214, 242, 226, 0.2),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total Loan Requested',
                            style: subSmallTextStyle,
                          ),
                          Text(
                            '7 (N2,300,000)',
                            style: subTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total Loan Granted',
                            style: subSmallTextStyle,
                          ),
                          Text(
                            '8 (N3,100,000)',
                            style: subTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyAccount()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: iconColor,
                ),
                title: Text(
                  'My Account',
                  style: subTextStyle,
                ),
                style: ListTileStyle.list,
                subtitle: Text(
                  'Account',
                  style: subSmallTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: iconColor,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.shield,
                color: iconColor,
              ),
              title: Text(
                'Transaction Pin',
                style: subTextStyle,
              ),
              style: ListTileStyle.list,
              subtitle: Text(
                'Account',
                style: subSmallTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor,
              ),
            ),
            ListTile(
                leading: const Icon(
                  Icons.lock_open_outlined,
                  color: iconColor,
                ),
                title: const Text(
                  'Biometric Login',
                  style: subTextStyle,
                ),
                style: ListTileStyle.list,
                subtitle: const Text(
                  'Account',
                  style: subSmallTextStyle,
                ),
                trailing: Transform.scale(
                  scale: 2,
                  child: Switch.adaptive(
                    thumbColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(39, 66, 157, 1)),
                    trackColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(8, 25, 82, 1)),
                    value: value,
                    onChanged: (bool value) => setState(() {
                      this.value = value;
                    }),
                  ),
                )),
            ListTile(
                leading: const Icon(
                  Icons.lock_open_outlined,
                  color: iconColor,
                ),
                title: const Text(
                  'Biometric Transaction',
                  style: subTextStyle,
                ),
                style: ListTileStyle.list,
                subtitle: const Text(
                  'Account',
                  style: subSmallTextStyle,
                ),
                trailing: Transform.scale(
                  scale: 2,
                  child: Switch.adaptive(
                    thumbColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(39, 66, 157, 1)),
                    trackColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(8, 25, 82, 1)),
                    value: value,
                    onChanged: (bool value) => setState(() {
                      this.value = value;
                    }),
                  ),
                )),
            ListTile(
                leading: const Icon(
                  Icons.remove_red_eye,
                  color: iconColor,
                ),
                title: const Text(
                  'Hide my visibility',
                  style: subTextStyle,
                ),
                style: ListTileStyle.list,
                subtitle: const Text(
                  'Account',
                  style: subSmallTextStyle,
                ),
                trailing: Transform.scale(
                  scale: 2,
                  child: Switch.adaptive(
                    thumbColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(254, 208, 183, 1)),
                    trackColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(249, 249, 251, 1)),
                    value: value,
                    onChanged: (bool value) => setState(() {
                      this.value = value;
                    }),
                  ),
                )),
            const ListTile(
              leading: Icon(
                Icons.headset_mic,
                color: iconColor,
              ),
              title: Text(
                'Support',
                style: subTextStyle,
              ),
              style: ListTileStyle.list,
              subtitle: Text(
                'Account',
                style: subSmallTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.star,
                color: iconColor,
              ),
              title: Text(
                'Rate our app',
                style: subTextStyle,
              ),
              style: ListTileStyle.list,
              subtitle: Text(
                'Account',
                style: subSmallTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor,
              ),
            ),
            ListTile(
                leading: const Icon(
                  Icons.wb_sunny,
                  color: iconColor,
                ),
                title: const Text(
                  'Light mode',
                  style: subTextStyle,
                ),
                style: ListTileStyle.list,
                subtitle: const Text(
                  'Account',
                  style: subSmallTextStyle,
                ),
                trailing: Transform.scale(
                  scale: 2,
                  child: Switch.adaptive(
                    thumbColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(39, 66, 157, 1)),
                    trackColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(8, 25, 82, 1)),
                    value: value,
                    onChanged: (bool value) => setState(() {
                      this.value = value;
                    }),
                  ),
                )),
            const ListTile(
              leading: Icon(
                Icons.shield,
                color: iconColor,
              ),
              title: Text(
                'Privacy Policy',
                style: subTextStyle,
              ),
              style: ListTileStyle.list,
              subtitle: Text(
                'Account',
                style: subSmallTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.note_add_sharp,
                color: iconColor,
              ),
              title: Text(
                'Terms & Conditions',
                style: subTextStyle,
              ),
              style: ListTileStyle.list,
              subtitle: Text(
                'Account',
                style: subSmallTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: iconColor,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Logout',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Stiepa',
                    color: Color.fromRGBO(229, 75, 77, 1)),
              ),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(50)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(229, 75, 77, 1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(backgroundColor)),
            ),
            const SizedBox(
              height: 81,
            ),
          ],
        ),
      ),
    );
  }
}
