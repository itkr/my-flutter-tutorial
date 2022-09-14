import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

class ListWords extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ListWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomWordsStore(),
      child: Scaffold(
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
      ),
    );
  }
}

class RandomWordsStore with ChangeNotifier {
  final suggestions = <WordPair>[];
  final favoriteIndexes = <int>[];

  void addAllSuggestions(Iterable<WordPair> wordPairs) {
    suggestions.addAll(wordPairs);
    notifyListeners();
  }

  void setFavorite(index) {
    if (favoriteIndexes.contains(index)) {
      favoriteIndexes.remove(index);
    } else {
      favoriteIndexes.add(index);
    }
    notifyListeners();
  }
}

class RandomWords extends StatelessWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final addAllSuggestions =
    //     context.read<RandomWordsStore>().addAllSuggestions;
    final favoriteIndexes = context.read<RandomWordsStore>().favoriteIndexes;
    // final suggestions = context.read<RandomWordsStore>().suggestions;
    final setFavorite = context.watch<RandomWordsStore>().setFavorite;
    final suggestions = <WordPair>[];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return const Divider();
        }
        final index = i ~/ 2;
        if (index >= suggestions.length) {
          // addAllSuggestions(generateWordPairs().take(10));
          suggestions.addAll(generateWordPairs().take(10));
        }
        IconData iconData = favoriteIndexes.contains(index)
            ? Icons.favorite
            : Icons.favorite_outline;
        return ListTile(
          title: Text(
            suggestions[index].asPascalCase,
            style: const TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(iconData),
          onTap: () {
            setFavorite(index);
          },
        );
      },
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suggestions = <WordPair>[];
    suggestions.addAll(generateWordPairs().take(10));
    // final suggestions = context.read<RandomWordsStore>().suggestions;
    final favoriteIndexes = context.read<RandomWordsStore>().favoriteIndexes;
    final setFavorite = context.watch<RandomWordsStore>().setFavorite;

    favoriteIndexes.sort();
    List<Widget> children = [];
    for (int favoriteIndex in favoriteIndexes) {
      children.add(ListTile(
        title: Text(
          suggestions[favoriteIndex].asPascalCase,
          style: const TextStyle(fontSize: 18.0),
        ),
        trailing: const Icon(Icons.delete),
        onTap: () {
          setFavorite(favoriteIndex);
        },
      ));
    }
    return ListView(children: children);
  }
}
