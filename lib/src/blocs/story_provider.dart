import 'package:flutter/material.dart';
import './story_bloc.dart';

class StoriesProvider extends InheritedWidget{
  final Storiesbloc bloc;

  StoriesProvider({Key key, Widget child}) 
    : bloc = Storiesbloc(),
    super(key:key, child:child);

  bool updateShouldNotify(_) => true;

  static Storiesbloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StoriesProvider) as StoriesProvider).bloc;
  }
}