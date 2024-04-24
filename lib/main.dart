import 'dart:math';
import 'package:flutter/material.dart';

class Fruit {
  final String name;
  final String image;

  Fruit(this.name, this.image);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Fruit> fruits = [];
  Color _currentColor = Colors.blue;

  String imagePath(String fruitName) {
    return 'images/$fruitName.png';
  }

  Color randomColor() {
    return _currentColor == Colors.blue ? Colors.lightBlue : Colors.blue;
  }

  Fruit randomFruit() {
    final List<Fruit> fruitsPossibles = [
      Fruit('Pomme', 'pomme'),
      Fruit('Poire', 'poire'),
      Fruit('Ananas', 'ananas')
    ];
    return fruitsPossibles[Random().nextInt(fruitsPossibles.length)];
  }

  void _ajouterFruit() {
    setState(() {
      final newFruit = randomFruit();
      fruits.add(newFruit);
      _currentColor = randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de fruits'),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (BuildContext context, int index) {
          final fruit = fruits[index];
          return ListTile(
            leading: Image.asset(imagePath(fruit.image)),
            title: Text(
              fruit.name,
              style: TextStyle(
                color: index.isEven ? Colors.white : Colors.black,
              ),
            ),
            tileColor: index.isEven ? _currentColor : Colors.white,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ajouterFruit,
        child: const Icon(Icons.add),
      ),
    );
  }
}
