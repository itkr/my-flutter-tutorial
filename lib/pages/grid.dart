import 'package:flutter/material.dart';

class ImageGridPage extends StatelessWidget {
  const ImageGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("photo1"),
      _photoItem("photo1"),
      _photoItem("photo1"),
      _photoItem("photo1"),
      _photoItem("photo1"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(3),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        children: list,
      ),
    );
  }

  Widget _photoItem(String imageName) {
    var assetsImage = "assets/images/$imageName.jpg";
    return Image.asset(
      assetsImage,
      fit: BoxFit.cover,
    );
  }
}
