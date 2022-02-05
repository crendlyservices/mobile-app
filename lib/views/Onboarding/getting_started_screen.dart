import 'package:flutter/material.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Hello'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text(
                      'Getting started',
                      style: TextStyle(fontSize: 18),
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      'Have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
