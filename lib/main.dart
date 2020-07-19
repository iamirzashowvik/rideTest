import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'homepage.dart';
import 'loading_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/i18n.dart';

import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        location_picker.S.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
      ],
      home: Homepage(),
      routes: {
        'login': (context) => Login(),
        'signup': (context) => Signup(),
        'homepage': (context) => Homepage(),
      },
    );
  }
}
