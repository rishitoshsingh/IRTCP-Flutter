import 'package:flutter/material.dart';
import 'package:hello/presentation/custom_icons_icons.dart';

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
