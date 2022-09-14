import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter.'),
        actions: ActionIcons.getIcons(context),
      ),
      drawer: Drawer(
        child: MainNavigation(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[300],
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('/home');
        },
        child: const Icon(Icons.autorenew),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const BarcodeCardWidget(),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: CurrentPointWidget(),
            ),
            CustomButtonsWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(right: 100.0),
                  alignment: Alignment.center,
                  child: const Text('A', style: TextStyle(fontSize: 20.0)),
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text('B', style: TextStyle(fontSize: 20.0)),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class BarcodeCardWidget extends StatelessWidget {
  const BarcodeCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: BarcodeWidget(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 10.0,
          bottom: 10.0,
          left: 10.0,
        ),
        barcode: Barcode.code128(),
        data: WordPair.random().asPascalCase,
        width: 300.0,
        height: 100.0,
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({Key? key}) : super(key: key);

  // TODO: 型定義
  final List<Map<String, Object>> _bottomNavigationItems = [
    {
      'label': 'card',
      'icon': Icons.credit_card,
    },
    {
      'label': 'search',
      'icon': Icons.search,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(_bottomNavigationItems[0]['icon'] as IconData),
          label: _bottomNavigationItems[0]['label'] as String,
        ),
        BottomNavigationBarItem(
          icon: Icon(_bottomNavigationItems[1]['icon'] as IconData),
          label: _bottomNavigationItems[1]['label'] as String,
        ),
      ],
      onTap: (int index) {
        final snackBar = SnackBar(
          content: Text(_bottomNavigationItems[index]['label'] as String),
          action: SnackBarAction(
            label: 'close',
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
          ),
          duration: const Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class CurrentPointWidget extends StatelessWidget {
  const CurrentPointWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
        right: 30.0,
        bottom: 10.0,
        left: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.pink),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textBaseline: TextBaseline.ideographic,
        children: const [
          Text(
            '利用可能ポイント: ',
            style: TextStyle(fontSize: 11.0),
          ),
          Text(
            '2000',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class CustomButtonsWidget extends StatelessWidget {
  CustomButtonsWidget({Key? key}) : super(key: key);

  final _iconDataList = [
    Icons.star,
    Icons.shopping_cart,
    Icons.flutter_dash,
    Icons.rocket,
    Icons.mail,
    Icons.favorite,
  ];

  Widget _buildButton(IconData iconData, {Color? color = Colors.pink}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Icon(iconData, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = <Widget>[];

    for (var iconData in _iconDataList) {
      buttons.add(_buildButton(iconData, color: Colors.pink[200]));
    }
    buttons.add(_buildButton(Icons.plus_one, color: Colors.grey));

    return Flexible(
      child: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.only(left: 55, right: 55),
        children: buttons,
      ),
    );
  }
}

class ActionIcons {
  static List<Widget> getIcons(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (childContext) {
              return SimpleDialog(
                title: const Text('Information'),
                children: <Widget>[
                  SimpleDialogOption(
                    onPressed: () {},
                    child: const Text("・First Item"),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.info_outline, color: Colors.white),
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('お知らせ'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    ];
  }
}

class MainNavigation extends StatelessWidget {
  MainNavigation({Key? key}) : super(key: key);

  // TODO: 型定義
  final List<Map<String, Object>> _links = [
    {'title': 'Home', 'iconData': Icons.home},
    {'title': 'Profile', 'iconData': Icons.person},
    {'title': 'List', 'iconData': Icons.list, 'linkName': '/list'},
    {'title': 'Sub', 'iconData': Icons.abc, 'linkName': '/subpage'},
    {'title': 'Images', 'iconData': Icons.image, 'linkName': '/grid'},
    {'title': 'Settings', 'iconData': Icons.settings, 'linkName': '/settings'},
  ];

  Widget _buiildLink(
    BuildContext context,
    String title,
    IconData iconData,
    String? linkName,
  ) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pop(context);
        if (linkName != null) {
          Navigator.of(context).pushNamed(linkName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const profileImage = AssetImage('assets/images/photo1.jpg');
    List<Widget> children = [
      DrawerHeader(
        decoration: const BoxDecoration(color: Colors.red),
        child: Row(children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: profileImage),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Drawer Header'),
          ),
        ]),
      ),
    ];
    for (var linkItem in _links) {
      children.add(_buiildLink(
        context,
        linkItem['title'] as String,
        linkItem['iconData'] as IconData,
        linkItem['linkName'] as String?,
      ));
    }
    ListView widget = ListView(children: children);
    return widget;
  }
}
