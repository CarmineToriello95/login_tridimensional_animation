import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'home/home.dart';
import 'login/left_login.dart';
import 'login/right_login.dart';

class DoorOpeningAnimation extends StatefulWidget {
  final VoidCallback onLoggedOut;
  DoorOpeningAnimation({@required this.onLoggedOut});
  @override
  _DoorOpeningAnimationState createState() => _DoorOpeningAnimationState();
}

class _DoorOpeningAnimationState extends State<DoorOpeningAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animationController.forward();
  }

  _onLogoutPressed() async {
    await _animationController.reverse();
    widget.onLoggedOut();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, snapshot) {
          return Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Transform.scale(
                  scale: Tween<double>(begin: 0.0, end: 1.0)
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(0.3, 1.0),
                        ),
                      )
                      .value,
                  child: Opacity(
                    opacity: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.3, 1.0),
                          ),
                        )
                        .value,
                    child: Home(
                      onLogoutPressed: () => _onLogoutPressed(),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(MediaQuery.of(context).size.width / 2, 0.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(_animationController.value * math.pi / 2),
                  child: Container(
                    color: Colors.white,
                    child: RightLogin(),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(-MediaQuery.of(context).size.width / 2, 0.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-_animationController.value * math.pi / 2),
                  child: Container(
                    color: Colors.white,
                    child: LeftLogin(),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
