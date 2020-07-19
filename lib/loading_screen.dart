import 'login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Image(
                image: AssetImage('assets/ride.png'),
                height: 200,
                width: 200,
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 80,
              ),
            ),
            Flexible(
              child: SpinKitWave(
                size: 50,
                color: Color(0xFF3FB893),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 80,
              ),
            ),
            Flexible(
              child: Text(
                'Ride Test',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
