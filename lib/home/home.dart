import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_app_bar.dart';

class Home extends StatefulWidget {
  final VoidCallback onLogoutPressed;
  Home({@required this.onLogoutPressed});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const options = ['All', 'Indoor', 'Outdoor', 'Garden', 'Summer'];
  int optionSelectedIndex = 0;
  int _currentNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentNavBarIndex,
        onItemTap: (index) {
          setState(() {
            _currentNavBarIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Hi, Carmine',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Sansita',
                        color: firstColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => widget.onLogoutPressed(),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/avatar.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 280,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.grey[100],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.search, color: Colors.black12),
                          SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Search...',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.sort,
                      color: Colors.black26,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                _buildOptionsList(),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.75,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 1.75,
                          width: MediaQuery.of(context).size.width / 1.5,
                          margin: const EdgeInsets.only(right: 8.0),
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 2.7,
                                left: 16.0,
                                right: 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Indoor',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Monsterra\nDeliciosa',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height / 8.5,
                          child: Image.asset(
                            'assets/images/plant_1.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildOptionsList() {
    return Container(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                optionSelectedIndex = index;
              });
            },
            child: OptionItem(
              text: options[index],
              isSelected: index == optionSelectedIndex,
            ),
          );
        },
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  OptionItem({this.text, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 35.0,
      margin: const EdgeInsets.only(right: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: isSelected ? firstColor : Colors.black26,
              fontSize: 16.0,
            ),
          ),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? firstColor : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
