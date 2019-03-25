import 'package:flutter/material.dart';
import './screens/new_list.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New!',
      home: NewsList(),
    );
  }
}