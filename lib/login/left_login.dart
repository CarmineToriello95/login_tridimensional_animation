import 'package:flutter/material.dart';

import '../constants.dart';

class LeftLogin extends StatefulWidget {
  @override
  _LeftLoginState createState() => _LeftLoginState();
}

class _LeftLoginState extends State<LeftLogin> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: loginGradientBoxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Sig',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Sansita',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _getPadding(),
                ),
                child: Container(
                  decoration: loginFieldsBoxDecoration,
                  width: 100,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.email, color: Colors.black54),
                      SizedBox(
                        width: 16.0,
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _getPadding(),
                ),
                child: Container(
                  decoration: loginFieldsBoxDecoration,
                  width: 100,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.lock, color: Colors.black54),
                      SizedBox(
                        width: 16.0,
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 214.0),
              Container(
                height: 20.0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Create Ne',
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
