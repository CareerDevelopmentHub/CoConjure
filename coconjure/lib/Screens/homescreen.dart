import 'package:coconjure/Screens/test.dart';
import 'package:coconjure/ServicesScreens/serviceScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;
import 'package:coconjure/contants.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'worldwidepannel.dart';
import 'dart:async';
import 'MostAffectedCountries.dart';
import 'Regional.dart';

class HomeScreen extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen> {
  List sortedData;
  Map<dynamic, dynamic> worldDATA;
  fetchWorldData() async
  {
    http.Response response = await http.get(Uri.parse(worldurl2));
    http.Response sortedResponse = await http.get(Uri.parse(sortedUrl));
    setState(() {
      worldDATA = json.decode(response.body);
      sortedData = json.decode(sortedResponse.body);
      // print(sortedData);
      // print(worldDATA);
    }
    );
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  @override
  void initState() {
    // TODO: implement initState
    fetchWorldData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'CoConjure',
            style: TextStyle(color: Colors.green),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff202c3b),
        ),
        body: Scaffold(
          body: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Container(
              //   height: 60,
              //   padding: EdgeInsets.all(10.0),
              //   alignment: Alignment.center,
              //   color: Colors.teal[100],
              //   child: Text(DataSource.quote, style: TextStyle(
              //     color: Colors.orange[700],
              //     fontWeight: FontWeight.w600,
              //     fontSize: 16,
              //   ),),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('India', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,letterSpacing: 2),),
                    // Container(
                    //     decoration: BoxDecoration(  color: Colors.blue[800],
                    //         borderRadius: BorderRadius.circular(14)
                    //
                    //     ),

                        // padding:  EdgeInsets.all(8.0),
                        // child: GestureDetector(onTap:(){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> statepage()));
                        // }, child: Text('Regional', style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),)
                        // )
                    // ),
                  ],
                ),
              ),
              worldDATA ==null ? Center(
                child: SpinKitDualRing(
                  color: Colors.green,
                  size: 45.0,),
              ):
              WorldWidePanel(worldData: worldDATA),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Most Affected Countries' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold , color: Colors.red[400]),),
              ),
              sortedData==null?Container(): MostaffectedCountries(sortedData: sortedData,),
              SizedBox(height: 10,),

              // infoPanel(),
                SizedBox(height: 30,),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> statepage()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
                  color: Color(0xff202c3b),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Regional Details',style:
                      TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18)),
                      Icon(Icons.arrow_forward, color: Colors.white,),


                    ],

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25 , horizontal: 10),
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Text(
                    // 'WE ARE TOGETHER IN THE FIGHT',
                    
                    'CORONA HAREGA\n HUM JEETENGE ',
                    style: TextStyle(
                      // backgroundColor:Color(0xff202c3b),
                        fontWeight: FontWeight.bold,

                        fontSize: 20,letterSpacing: 8,
                    // color: Colors.white
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
            ],
          ),
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
                tabBackgroundColor: Colors.yellow,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    iconSize: 30,
                    text: 'Home',
                    onPressed: () {},
                  ),
                  GButton(
                    icon: Icons.local_hospital_sharp,
                    text: 'Services',
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceScreen(),
                          ));
                    },
                  ),
                  GButton(
                    icon: LineIcons.phone,
                    text: 'Emergency Call',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MytestApp()),
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

