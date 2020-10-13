import 'package:flutter/material.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  final Function() onAnimationCompleted;
  final bool reverseAnimation;
  Login({@required this.onAnimationCompleted, @required this.reverseAnimation});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool _isLoggingIn;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed && _isLoggingIn) {
            widget.onAnimationCompleted();
          }
        },
      );
    if (widget.reverseAnimation) {
      _isLoggingIn = false;
      _animationController.reverse(from: 1.0);
    } else {
      _isLoggingIn = true;
    }
  }

  _login() {
    if (_animationController.isDismissed) {
      _isLoggingIn = true;
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: loginGradientBoxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (_, child) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sig',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'Sansita'),
                          ),
                          Text(
                            'n in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontFamily: 'Sansita'),
                          ),
                        ],
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
                        width: 100 +
                            (1 - _animationController.value) *
                                MediaQuery.of(context).size.width /
                                2,
                        height: 50.0,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.email, color: Colors.black54),
                            SizedBox(
                              width: 16.0,
                            ),
                            _animationController.value < 0.5
                                ? Expanded(
                                    child: Opacity(
                                      opacity: Tween<double>(begin: 1, end: 0)
                                          .animate(
                                            CurvedAnimation(
                                              curve: Interval(0.0, 0.5),
                                              parent: _animationController,
                                            ),
                                          )
                                          .value,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Email',
                                        ),
                                      ),
                                    ),
                                  )
                                : Opacity(
                                    opacity: Tween<double>(begin: 0, end: 1)
                                        .animate(
                                          CurvedAnimation(
                                            curve: Interval(0.5, 1.0),
                                            parent: _animationController,
                                          ),
                                        )
                                        .value,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.black54,
                                    ),
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
                        width: 100 +
                            (1 - _animationController.value) *
                                MediaQuery.of(context).size.width /
                                2,
                        height: 50.0,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.lock, color: Colors.black54),
                            SizedBox(
                              width: 16.0,
                            ),
                            _animationController.value < 0.5
                                ? Expanded(
                                    child: Opacity(
                                      opacity: Tween<double>(begin: 1, end: 0)
                                          .animate(
                                            CurvedAnimation(
                                              curve: Interval(0.0, 0.5),
                                              parent: _animationController,
                                            ),
                                          )
                                          .value,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Password',
                                        ),
                                        obscureText: true,
                                      ),
                                    ),
                                  )
                                : Opacity(
                                    opacity: Tween<double>(begin: 0, end: 1)
                                        .animate(
                                          CurvedAnimation(
                                            curve: Interval(0.5, 1.0),
                                            parent: _animationController,
                                          ),
                                        )
                                        .value,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.black54,
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Opacity(
                      opacity: Tween<double>(begin: 1, end: 0)
                          .animate(
                            CurvedAnimation(
                              curve: Interval(0.0, 0.5),
                              parent: _animationController,
                            ),
                          )
                          .value,
                      child: Container(
                        height: 20.0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: (MediaQuery.of(context).size.width -
                                      (MediaQuery.of(context).size.width / 2 +
                                          100)) /
                                  2),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password ?',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: _getPadding()),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 50.0,
                          width: 100,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            )),
                            onPressed: _login,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Create Ne',
                            style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'w Account',
                            style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
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
