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
import 'secondroute.dart';
import 'reglogi.dart';
import 'main.dart';

_makingPhoneCall() async {
  const url = 'tel:07525075469';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class customersupport extends StatelessWidget {
  void launchwhatsapp(@required number, @required message) async {
    String url = 'whatsapp://send?phone=$number&text=$message';
    await canLaunch(url) ? launch(url) : print("Cannot open Whatsapp");
  }

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
      floatingActionButton: SizedBox(
        width: 80.0,
        height: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            launchwhatsapp("+917525075469", "Hello");
          },
          child: const Icon(
            MdiIcons.whatsapp,
            color: Colors.white,
            size: 40.0,
          ),
          backgroundColor: Colors.green,
        ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 200.0,
                  width: 500.0,
                  image: AssetImage(
                      'images/customersupport-removebg-preview.png')),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: RaisedButton(
                      color: Colors.green,
                      splashColor: Colors.black,
                      highlightColor: Colors.yellow.withOpacity(1.0),
                      elevation: 40.0,
                      onPressed: _makingPhoneCall,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "9918407905",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Koho',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                  thickness: 5.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: RaisedButton(
                      color: Colors.white,
                      splashColor: Colors.black,
                      highlightColor: Colors.yellow.withOpacity(1.0),
                      elevation: 40.0,
                      onPressed: launchapp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        MdiIcons.instagram,
                        color: Colors.purple,
                        size: 35.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      "@scoobiservices",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Koho',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                  thickness: 5.0,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white12,
                  ),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.red,
                    size: 35.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "www.scoobiservices.com",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Koho',
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
