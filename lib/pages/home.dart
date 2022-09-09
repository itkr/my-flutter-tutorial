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
      drawer: const Drawer(
        child: MainNavigation(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.autorenew),
        backgroundColor: Colors.pink[300],
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('/home');
        },
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: BarcodeWidget(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  right: 10.0,
                  bottom: 5.0,
                  left: 10.0,
                ),
                barcode: Barcode.code128(),
                data: WordPair.random().asPascalCase,
                width: 300.0,
                height: 100.0,
              ),
            ),
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
        icon: const Icon(Icons.credit_card, color: Colors.white),
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('お知らせ'),
            // action: SnackBarAction(
            //   label: 'close',
            //   onPressed: () {
            //     // TODO: Providorなどを使う
            //     ScaffoldMessenger.of(context).removeCurrentSnackBar();
            //   },
            // ),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    ];
  }
}

class MainNavigation extends StatelessWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.red),
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text('List'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/list');
          },
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: const Text('Sub'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/subpage');
          },
        ),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text('Images'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/grid');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/settings');
          },
        ),
      ],
    );
  }
}
