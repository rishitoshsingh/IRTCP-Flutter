import 'package:flutter/material.dart';
import './home.dart';
import './strings.dart';

void main() => runApp(IrtcpApp());

class IrtcpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue,
        accentColorBrightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}
