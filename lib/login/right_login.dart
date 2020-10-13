import 'package:flutter/material.dart';

import '../constants.dart';

class RightLogin extends StatefulWidget {
  @override
  _RightLoginState createState() => _RightLoginState();
}

class _RightLoginState extends State<RightLogin> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: loginGradientBoxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'n in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Sansita',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 220.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: _getPadding(),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 50.0,
                    width: 100,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green[900],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Container(
                height: 20.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'w Account',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getPadding() {
    return (MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width / 2 + 100)) /
        2;
  }
}
