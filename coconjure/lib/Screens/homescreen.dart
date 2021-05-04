import 'package:coconjure/Screens/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('CoConjure'),
      ),
      body: Center(
        child: TextButton(
          child: Text("Hello"),
          onPressed: (){},
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.black87,
              hoverColor: Colors.yellow,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.green,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  iconSize: 30,
                  text: 'Home',
                  onPressed: (){},
                ),
                GButton(
                  icon: Icons.local_hospital_sharp,
                  text: 'Services',
                  onPressed: (){},
                ),
                GButton(
                  icon: LineIcons.phone,
                  text: 'Emergency Call',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:
                            (context) => MytestApp()),
                      );
                    },
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}


