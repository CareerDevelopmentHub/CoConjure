import 'package:coconjure/ServicesScreens/serviceScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'homescreen.dart';

class MytestApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MytestApp> {
  TextEditingController _numberCtrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            'Plugin Example',
            style: TextStyle(color: Colors.green),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff202c3b),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 225,
                    color: Colors.blue[50],
                    child: Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Tile("Andhra Pradesh ", "08662410978"),
                          Tile("Arunachal Pradesh ", "09436055743"),
                          Tile("Assam ", "06913347770"),
                          Tile("Bihar ", "104"),
                          Tile("Chhattisgarh ", "104"),
                          Tile("Goa ", "104"),
                          Tile("Gujarat", "104"),
                          Tile("Haryana", "8558893911"),
                          Tile("Himachal Pradesh", "104"),
                          Tile("Jharkhand", "104"),
                          Tile("Karnataka", "104"),
                          Tile("Kerela", "04712552056"),
                          Tile("Madhya Pradesh", "104"),
                          Tile("Maharashtra", "02026127394"),
                          Tile("Manipur", "3852411668"),
                          Tile("Meghalaya", "108"),
                          Tile("Mizoram", "102"),
                          Tile("Nagaland", "7005539653"),
                          Tile("Odisha", "9439994859"),
                          Tile("Punjab", "104"),
                          Tile("Rajsthan", "01412225624"),
                          Tile("Sikkim", "104"),
                          Tile("Tamil Nadu ", "04429510500"),
                          Tile("Telangana", "104"),
                          Tile("Tripura", "03812315879"),
                          Tile("Uttarakhand", "104"),
                          Tile("Uttar Pradesh", "18001805145"),
                          Tile("West Bengal", "1800313444222"),
                          Text(
                            "Union Territory ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Tile("Andaman and Nicobar Islands ", "03192232102"),
                          Tile("Chandigarh ", "9779558282"),
                          Tile(" Dadra and Nagar Haveli and\n Daman &  Diu ",
                              "104"),
                          Tile("Delhi ", "01122307145"),
                          Tile("Jammu and Kashmir ", "01912520982"),
                          Tile("Ladakh ", "01982256462"),
                          Tile("Lakshadweep ", "104"),
                          Tile("Puducherry ", "104"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  GButton(
                    icon: Icons.local_hospital_sharp,
                    text: 'Services',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceScreen()),
                      );
                    },
                  ),
                  GButton(
                    icon: LineIcons.phone,
                    text: 'Emergency Call',
                    onPressed: () {},
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
      ),
    );
  }

  Widget Tile(String title, String contact) {
    return Column(children: [
      ListTile(
        title: Text(
          title + " Helpline number",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        trailing: GestureDetector(
            onTap: () async {
              // const number = contact;  //set the number here
              bool res = await FlutterPhoneDirectCaller.callNumber(contact);
            },
            child: Icon(
              Icons.call,
              color: Colors.green.withOpacity(1),
            )),
        selected: true,
        selectedTileColor: Colors.white,
      ),
      Divider(
        height: 10,
        color: Colors.blueGrey,
      ),
    ]);
  }
}
