import 'package:flutter/material.dart';

import '../constants.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTap;
  CustomNavBar({this.currentIndex, this.onItemTap});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  double itemWidth;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    itemWidth = MediaQuery.of(context).size.width / 3;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomNavBarItem(
          icon: Icons.home,
          width: itemWidth,
          isSelected: widget.currentIndex == 0,
          onTap: () => widget.onItemTap(0),
        ),
        CustomNavBarItem(
          icon: Icons.camera,
          width: itemWidth,
          isSelected: widget.currentIndex == 1,
          onTap: () => widget.onItemTap(1),
        ),
        CustomNavBarItem(
          icon: Icons.favorite_border,
          width: itemWidth,
          isSelected: widget.currentIndex == 2,
          onTap: () => widget.onItemTap(2),
        ),
      ],
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final bool isSelected;
  final double width;
  final IconData icon;
  final Function onTap;
  CustomNavBarItem({this.isSelected, this.width, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: width,
        decoration: isSelected
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 4.0, color: firstColor.withOpacity(0.7)),
                ),
                gradient: LinearGradient(
                  colors: [
                    firstColor.withOpacity(0.3),
                    firstColor.withOpacity(0.015)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: isSelected ? firstColor : Colors.black45,
        ),
      ),
    );
  }
}
