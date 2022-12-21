import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(title: const Text("Name Generator")),
          body: const Center(child: RandomWords()),
        ));
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    final suggestion = <WordPair>[];
    const biggerFont = TextStyle(fontSize: 17);
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index.isOdd) return const Divider();
          final idx = index ~/ 2;
          if (idx >= suggestion.length) {
            suggestion.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(suggestion[idx].asPascalCase, style: biggerFont),
          );
        });
  }
}
