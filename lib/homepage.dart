import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LocationResult _pickedLocation1;
  LocationResult _pickedLocation2;
  double lat1;
  double lat2;
  double lng1;
  double lng2;
  @override
  Widget build(BuildContext context) {
    AnsiPen pen = new AnsiPen()..red(bold: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF252A3E),
          title: Text('Ride Test'),
          actions: <Widget>[
            OutlineButton(
                child: Text(
                  'logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, 'login');
                }),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                LocationResult result = await showLocationPicker(
                  context,
                  'AIzaSyCQ1aK9rg9URNvFWIe0wlZlko1C52uTexs',
                  initialCenter: LatLng(23.738315, 90.396044),
                  automaticallyAnimateToCurrentLocation: false,
//                      mapStylePath: 'assets/mapStyle.json',
                  myLocationButtonEnabled: true,
                  layersButtonEnabled: false,
//                      resultCardAlignment: Alignment.bottomCenter,
                );

                setState(() => _pickedLocation1 = result);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Choose Destination: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.location_on,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 80,
              color: Color(0xFFF2819D),
              child: _pickedLocation1 != null
                  ? Text(
                      'Your Destination: ${_pickedLocation1.address}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'Your Destination: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
            GestureDetector(
              onTap: () async {
                LocationResult result = await showLocationPicker(
                  context,
                  'AIzaSyCQ1aK9rg9URNvFWIe0wlZlko1C52uTexs',
                  initialCenter: LatLng(23.738315, 90.396044),
                  automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                  myLocationButtonEnabled: true,
                  layersButtonEnabled: false,
//                      resultCardAlignment: Alignment.bottomCenter,
                );

                setState(() => _pickedLocation2 = result);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Choose Pickup: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.location_on,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 80,
              color: Color(0xFFF2819D),
              child: _pickedLocation2 != null
                  ? Text(
                      'Your Pickup: ${_pickedLocation2.address}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'Your Pickup: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
