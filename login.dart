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
import 'main.dart';
import 'firstroute.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String email, password;
  bool show = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Image(
            image: AssetImage("images/scoobi.png"),
            width: 200,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: show,
        child: Container(
          width: 1000,
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
                  image: AssetImage("images/rene.png"),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(hintText: 'Enter your Email'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        InputDecoration(hintText: 'Enter your Password'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.red,
                  onPressed: () async {
                    setState(() {
                      show = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Firstroute()),
                        );
                      }
                      setState(() {
                        show = false;
                      });
                    } catch (e) {
                      setState(() {
                        show = false;
                      });
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("INVALID DETAILS"),
                          content: Text("WRONG CREDENTIALS"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("okay"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  elevation: 20,
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'Koho',
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
}
