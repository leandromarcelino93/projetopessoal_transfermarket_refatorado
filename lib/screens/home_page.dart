import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../components/players.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Transfermarket'),
      ),
      body: ListView(
        children: DUMMY_PLAYERS.map((pla){
          return Players(pla);
        }).toList(),
      ),
    );
  }
}