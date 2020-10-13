import 'package:flutter/material.dart';

import 'door_opening_animation.dart';
import 'login/login.dart';

class PagesHandler extends StatefulWidget {
  @override
  _PagesHandlerState createState() => _PagesHandlerState();
}

class _PagesHandlerState extends State<PagesHandler> {
  bool _isLoggedIn = false;
  bool _reverseLoginAnimation = false;

  @override
  Widget build(BuildContext context) {
    return !_isLoggedIn
        ? Login(
            reverseAnimation: _reverseLoginAnimation,
            onAnimationCompleted: () {
              setState(
                () {
                  _isLoggedIn = true;
                  _reverseLoginAnimation = false;
                },
              );
            },
          )
        : DoorOpeningAnimation(
            onLoggedOut: () {
              setState(
                () {
                  _isLoggedIn = false;
                  _reverseLoginAnimation = true;
                },
              );
            },
          );
  }
}
