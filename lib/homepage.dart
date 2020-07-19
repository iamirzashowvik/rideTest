import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_map_location_picker/google_map_location_picker.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LocationResult _pickedLocation1;
  LocationResult _pickedLocation2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride Test'),
        actions: <Widget>[
          OutlineButton(
              color: Colors.red,
              child: Text('logout'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, 'login');
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              LocationResult result = await showLocationPicker(
                context,
                'AIzaSyCQ1aK9rg9URNvFWIe0wlZlko1C52uTexs',
                initialCenter: LatLng(31.1975844, 29.9598339),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                myLocationButtonEnabled: true,
                layersButtonEnabled: true,
//                      resultCardAlignment: Alignment.bottomCenter,
              );
              print(' this is $result');
              setState(() => _pickedLocation1 = result);
            },
            child: Text('Choose Destination'),
          ),
          Text(_pickedLocation1.toString()),
          RaisedButton(
            onPressed: () async {
              LocationResult result = await showLocationPicker(
                context,
                'AIzaSyCQ1aK9rg9URNvFWIe0wlZlko1C52uTexs',
                initialCenter: LatLng(31.1975844, 29.9598339),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                myLocationButtonEnabled: true,
                layersButtonEnabled: true,
//                      resultCardAlignment: Alignment.bottomCenter,
              );
              print(' this is $result');
              setState(() => _pickedLocation2 = result);
            },
            child: Text('Choose Current Position'),
          ),
          Text(_pickedLocation2.toString()),
        ],
      ),
    );
  }
}