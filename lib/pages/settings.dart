import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nav'),
      ),
      body: const ClickGood(),
    );
  }
}

class ClickGood extends StatefulWidget {
  const ClickGood({Key? key}) : super(key: key);

  @override
  ClickGoodState createState() {
    return ClickGoodState();
  }
}

class ClickGoodState extends State<ClickGood> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: Center(
                child: Icon(
                  Icons.thumb_up,
                  color: _active ? Colors.orange[700] : Colors.grey[500],
                  size: 100.0,
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: _active ? Colors.orange[700] : Colors.grey[600],
              ),
              child: Center(
                child: Text(
                  _active ? 'Active' : 'Inactive',
                  style: const TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
