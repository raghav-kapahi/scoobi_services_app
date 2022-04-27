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
import 'firstroute.dart';
import 'main.dart';
import 'customersupport.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Image(
            image: AssetImage('images/scoobi.png'),
            width: 200,
          ),
        ),
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(Icons.menu,
              color: Colors.red, size: 35.0 // add custom icons also
              ),
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
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    "images/PICK AND DROP SERVICE.png"),
                                fit: BoxFit.fitHeight,
                                scale: 6.0,
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
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
                        highlightColor: Colors.red.withOpacity(1.0),
                        elevation: 20.0,
                        onPressed: () {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Formpage()),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: ListTile(
                            title: Text(
                              'Book Door To Door Service',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Koho',
                                //  fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.sensor_door_outlined,
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
                        color: Colors.red,
                        splashColor: Colors.black,
                        highlightColor: Colors.red.withOpacity(1.0),
                        elevation: 20.0,
                        onPressed: () {
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Formpage()),
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: ListTile(
                            title: Text(
                              'Book Pick And Drop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Koho',
                                //  fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.location_on_outlined,
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
                        color: Colors.red,
                        splashColor: Colors.black,
                        highlightColor: Colors.red.withOpacity(1.0),
                        elevation: 20.0,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: ListTile(
                            title: Text(
                              'Book An Appointment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Koho',
                                //   fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.book_online_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
