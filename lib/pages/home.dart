import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Flutter.')),
      drawer: const Drawer(
        child: MainNavigation(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(100, 100, 100, 0.4),
              // width: 300.0,
              height: 400.0,
              padding: const EdgeInsets.all(1.0),
              child: const RandomWords(),
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

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return const Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
