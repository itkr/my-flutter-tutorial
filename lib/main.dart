import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/pages/grid.dart';
import 'package:my_flutter_tutorial/pages/home.dart';
import 'package:my_flutter_tutorial/pages/list.dart';
import 'package:my_flutter_tutorial/pages/settings.dart';
import 'package:my_flutter_tutorial/pages/subpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      routes: {
        '/grid': (BuildContext context) => const ImageGridPage(),
        '/home': (BuildContext context) => Home(),
        '/list': (BuildContext context) => ListWords(),
        '/settings': (BuildContext context) => const SettingsPage(),
        '/subpage': (BuildContext context) => const SubPage(),
      },
      home: Home(),
    );
  }
}
