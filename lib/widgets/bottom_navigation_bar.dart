import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonStore with ChangeNotifier {
  int _bottomNavigationBarIndex = 0;
  int get bottomNavigationBarIndex => _bottomNavigationBarIndex;
  set bottomNavigationBarIndex(int index) {
    _bottomNavigationBarIndex = index;
    notifyListeners();
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(label: 'card', icon: Icon(Icons.credit_card)),
    const BottomNavigationBarItem(label: 'poll', icon: Icon(Icons.poll)),
    const BottomNavigationBarItem(label: 'search', icon: Icon(Icons.search)),
  ];

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CommonStore>();

    return BottomNavigationBar(
      currentIndex: store.bottomNavigationBarIndex,
      items: _bottomNavigationBarItems,
      onTap: (int index) {
        store.bottomNavigationBarIndex = index;
        final snackBar = SnackBar(
          content: Text(_bottomNavigationBarItems[index].label as String),
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
