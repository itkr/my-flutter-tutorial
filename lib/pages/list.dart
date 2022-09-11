import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListWords extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ListWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Welcome to Flutter.'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
        leading: const BackButton(),
      ),
      endDrawer: const Drawer(
        child: FavoriteWidget(),
      ),
      body: Container(
        padding: const EdgeInsets.all(1.0),
        child: const RandomWords(),
      ),
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
  final _favoriteIndexes = <int>[];

  Widget _buildRow(WordPair pair, int index) {
    IconData iconData = _favoriteIndexes.contains(index)
        ? Icons.favorite
        : Icons.favorite_outline;
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(iconData),
      onTap: () {
        setState(() {
          if (_favoriteIndexes.contains(index)) {
            _favoriteIndexes.remove(index);
          } else {
            _favoriteIndexes.add(index);
          }
        });
      },
    );
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
        return _buildRow(_suggestions[index], index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  FavoriteState createState() {
    return FavoriteState();
  }
}

class FavoriteState extends State {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <ListTile>[
        ListTile(
          title: const Text('a', style: TextStyle(fontSize: 18.0)),
          trailing: const Icon(Icons.favorite),
          onTap: () {},
        ),
        ListTile(
          title: const Text('b', style: TextStyle(fontSize: 18.0)),
          trailing: const Icon(Icons.favorite),
          onTap: () {},
        ),
      ],
    );
  }
}
