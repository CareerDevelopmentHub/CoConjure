import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

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
    int _selectedIndex = 0;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color:Colors.blue[50],
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: Text("Central COVID 19 Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '01123978046'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Andhra Pradesh Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '08662410978'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Arunachal Pradesh Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '09436055743'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Assam Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '06913347770'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Bihar Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '104'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Chhattisgarh Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '104'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Goa Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '104'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Gujarat Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '104'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Central COVID 19 Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '1123978046'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),
                        ListTile(
                          title: Text("Central COVID 19 Helpline number"),
                          trailing: Icon(Icons.call),
                          onTap: () async {
                            const number = '1123978046'; //set the number here
                            bool res = await FlutterPhoneDirectCaller.callNumber(number);
                          },
                          selected: true,
                          selectedTileColor: Colors.green,
                        ),


                      ],
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
      ),
    );
  }
}