import 'dart:async';
import './news_api_provider.dart';
import './news_db_provider.dart';
import '../models/item_model.dart';

class Repository extends Source{
  List<Source> sources = [
    newDbprovider,
    NewsApiProvider()
  ];

  List<Cache> caches = <Cache>[
    newDbprovider
  ];

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;
    for ( source in sources ){
      item = await source.fetchItem(id);
      if ( item != null ){
        break;
      }
    }

    for ( var cache in caches ) {
      cache.addItem(item);
    }

    return item;
  }

  Future<List<int>> fetchTopIds() async {
    return sources[1].fetchTopIds();
  }
}

abstract class Source {
  Future<ItemModel>fetchItem(int id);
  Future<List<int>>fetchTopIds();
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}