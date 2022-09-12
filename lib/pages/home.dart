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
            Card(
              margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
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
                      // blurRadius: 1.0,
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
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ],
                ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
        ],
        onTap: (int index) {},
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
                // TODO: Providerなどを使う
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
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
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.red),
          child: Row(children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/photo1.jpg"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Drawer Header'),
            ),
          ]),
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
