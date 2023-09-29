import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    final itemCount = 10;

    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: isPortrait
          ? ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ImageCard();
        },
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return ImageCard();
        },
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final imageUrl =
      "https://media.istockphoto.com/id/474578119/photo/tight-concept.webp?b=1&s=170667a&w=0&k=20&c=sMLiPqRoOO6oS53QeLAvhgQiRaSbHumFm87PcCt5x30=";
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Image.network(imageUrl, width: 150, height: 150),
      ),
    );
  }
}
