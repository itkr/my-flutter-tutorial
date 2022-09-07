import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/pages/subpage.dart';
import 'package:my_flutter_tutorial/pages/home.dart';
import 'package:my_flutter_tutorial/pages/grid.dart';
import 'package:my_flutter_tutorial/pages/list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      routes: {
        '/home': (BuildContext context) => const Home(),
        '/subpage': (BuildContext context) => const SubPage(),
        '/grid': (BuildContext context) => const ImageGridPage(),
        '/list': (BuildContext context) => const ListWords(),
      },
      home: const Home(),
    );
  }
}
