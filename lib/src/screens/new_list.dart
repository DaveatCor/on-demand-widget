import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top List'),),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, int index){
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot){
            return snapshot.hasData
             ? Text("I'm visible $index")
             :Text("I havent fetched on $index");
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(
      Duration(seconds: 2),
      () => 'hi',
    );
  }
}