// @dart=2.9
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'login.dart';
import 'signup.dart';
import 'main.dart';
import 'customersupport.dart';
import 'reglogi.dart';
import 'secondroute.dart';

class Firstroute extends StatelessWidget {
  Future<String> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    //print("${first.featureName} : ${first.addressLine}");
    return await first.addressLine;
  }

  var p;
  void foo() async {
    final s = await getLocation();
    p = s;
    print(s);
  }

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          // shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(28.0),
          //),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Hero(
              tag: "start",
              child: Image(
                image: AssetImage('images/scoobi.png'),
                width: 200,
              ),
            ),
          ),
          leading: PopupMenuButton(
            icon: Icon(
              Icons.menu,
              color: Colors.red,
              size: 40.0,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: FlatButton(
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    title: Text(
                      'History',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: FlatButton(
                  minWidth: 30.0,
                  //elevation: 0.0,
                  onPressed: () {
                    context;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => customersupport()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.contact_support_outlined,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    title: Text(
                      'Contact US',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    title: Text(
                      'Get location',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: FlatButton(
                  onPressed: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.article,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    title: Text(
                      'FUCK OFF',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => customersupport()),
            );
          },
          child: const Icon(
            Icons.support_agent_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.6, 0.1, 0.3],
              colors: [Colors.white, Colors.white12, Colors.black12],
            ),
          ),
          child: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView(
                  padding: EdgeInsets.only(top: 10.0),
                  shrinkWrap: true,
                  children: [
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("images/i2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("images/i3.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("images/i4.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("images/i5.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //5th Image of Slider
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("images/i6.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 200.0,
                        //  enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 1 / 10,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: 'l',
                  child: Image(
                    image: AssetImage("images/rene.png"),
                    width: 500.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.black,
                    thickness: 5.0,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Hero(
                    tag: 'h',
                    child: RaisedButton(
                      color: Colors.red,
                      splashColor: Colors.black,
                      highlightColor: Colors.yellow.withOpacity(1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38.0),
                      ),
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 60.0),
                        child: ListTile(
                          title: Text(
                            'Book For Servicing',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Koho',
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Icon(
                            Icons.motorcycle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                    thickness: 5.0,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Hero(
                    tag: 'j',
                    child: RaisedButton(
                      splashColor: Colors.black,
                      highlightColor: Colors.yellow.withOpacity(1.0),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 60.0),
                        child: ListTile(
                          title: Text(
                            'Book For Repair',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Koho',
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Icon(
                            Icons.miscellaneous_services_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200.0,
                  child: Divider(
                    thickness: 5.0,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Hero(
                    tag: 'k',
                    child: RaisedButton(
                      onPressed: launchURLBrowser,
                      elevation: 10.0,
                      color: Colors.red,
                      splashColor: Colors.black,
                      highlightColor: Colors.yellow.withOpacity(1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 60.0),
                        child: ListTile(
                          title: Text(
                            'Get Checkup',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: "Koho",
                              //  fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Icon(
                            Icons.check_box_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                Container(
                  width: 100,
                  child: RaisedButton(
                      elevation: 20,
                      color: Colors.red,
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontFamily: "Koho",
                        ),
                      ),
                      onPressed: () {
                        _auth.signOut();

                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
