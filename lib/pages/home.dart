import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Card(
              child: SizedBox(
                width: 300.0,
                height: 150.0,
                child: Text('Card'),
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
        icon: const Icon(Icons.credit_card, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed('/home');
        },
      ),
      IconButton(
        icon: const Icon(Icons.favorite, color: Colors.white),
        onPressed: () => {},
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
          title: const Text('Home'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('List'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/list');
          },
        ),
        ListTile(
          title: const Text('Sub'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/subpage');
          },
        ),
        ListTile(
          title: const Text('Image Grid'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/grid');
          },
        ),
      ],
    );
  }
}
