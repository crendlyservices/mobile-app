import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'My Account',
            ),
            const SizedBox(
              height: 63,
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
                  'Personal Information',
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyAccount()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.lock,
                  color: iconColor,
                ),
                title: Text(
                  'Password',
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyAccount()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.museum_outlined,
                  color: iconColor,
                ),
                title: Text(
                  'Bank Accounts',
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyAccount()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.credit_card_sharp,
                  color: iconColor,
                ),
                title: Text(
                  'Cards',
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
          ],
        ),
      ),
    );
  }
}
