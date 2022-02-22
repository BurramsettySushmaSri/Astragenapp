import 'package:flutter/material.dart';

import 'components/home_page.dart';

void main() => runApp(const MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Sample'))),
      
        // backgroundColor: Colors.yellow,
        body: const MyCardWidget(),
      ),
    );
  }
}

