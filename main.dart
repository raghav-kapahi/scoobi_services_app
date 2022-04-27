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
import 'customersupport.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

launchapp() async {
  const url = "https://www.instagram.com/scoobiservices/";
  if (await canLaunch(url)) {
    await launch(
      url,
      universalLinksOnly: true,
    );
  } else {
    throw 'There was a problem to open the url: $url';
  }
}

_launchURLBrowser() async {
  const url = 'https://scoobiservices.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

LaunchURLBrowser() async {
  const url = 'https://scoobiservices.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

launchURLBrowser() async {
  const url = 'https://scoobiservices.com/free-checkup/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => reglog())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.6, 0.1, 0.3],
              colors: [Colors.white, Colors.white12, Colors.black12],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "start",
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image(
                    image: AssetImage("images/scoobi.png"),
                    alignment: Alignment.topLeft,
                    height: 300,
                    width: 400,
                  ),
                ),
              ),
              Image(
                image: AssetImage("images/rene.png"),
                height: 200.0,
                width: 900.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'WELCOME TO SCOOBI SERVICES',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontFamily: 'Koho',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'YOUR TWO WHEELER SPECIALIST',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontFamily: 'Koho',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Formp extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<Formp> {
  final _formKey = GlobalKey<FormState>();
  String owname, addr, mob, vehno;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/scoobi.png'),
                height: 200.0,
                width: 300.0,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              onChanged: (value) {
                owname = value;
              },
              decoration: InputDecoration(
                hintText: 'Owner Name',
                suffixIcon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.red,
                ),
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontFamily: 'Bebas',
                ),
                contentPadding: EdgeInsets.only(left: 20.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
            width: double.infinity,
            child: Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              onChanged: (value) {
                mob = value;
              },
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.phone,
                  color: Colors.red,
                ),
                hintText: '10-Digit Mobile Number',
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontFamily: 'Bebas',
                ),
                contentPadding: EdgeInsets.only(left: 20.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field accepts only numbers';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
            width: double.infinity,
            child: Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              onChanged: (value) {
                vehno = value;
              },
              decoration: InputDecoration(
                hintText: 'Vehicle Number',
                suffixIcon: Icon(
                  Icons.bike_scooter,
                  color: Colors.red,
                ),
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontFamily: 'Bebas',
                ),
                contentPadding: EdgeInsets.only(left: 20.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
            width: double.infinity,
            child: Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              onChanged: (value) {
                addr = value;
              },
              decoration: InputDecoration(
                hintText: 'Address',
                suffixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.red,
                ),
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontFamily: 'Bebas',
                ),
                contentPadding: EdgeInsets.only(left: 20.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
            width: double.infinity,
            child: Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  _firestore.collection('formdata').add({
                    'ownername': owname,
                    'mobno': mob,
                    'vehno': vehno,
                    'addr': addr,
                  });
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form Submitted')));
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Formpage extends StatelessWidget {
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
      body: Formp(),
      backgroundColor: Colors.yellow,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentAddress != null) Text(_currentAddress),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
