import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search_history_api/search_history_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHistoryApi extends SearchHistoryApi {
  LocalHistoryApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }
  final SharedPreferences _plugin;

  final _searchHisStreamController =
      BehaviorSubject<List<SearchHistoryModel>>.seeded([]);

  @visibleForTesting
  static const kSearchHisCollectionKey = '__search_history_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final historiesJson = _getValue(kSearchHisCollectionKey);
    if (historiesJson != null) {
      final histories = List<Map>.from(json.decode(historiesJson) as List)
          .map((jsonMap) =>
              SearchHistoryModel.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _searchHisStreamController.add(histories);
    } else {
      _searchHisStreamController.add(const []);
    }
  }

  @override
  Future<void> addSearchHistory(String data) async {
    final histories = [..._searchHisStreamController.value];
    final newHistory = SearchHistoryModel(searchData: data);
    final historyIndex =
        histories.indexWhere((t) => t.searchData == newHistory.searchData);
    if (historyIndex >= 0) {
      histories[historyIndex] = newHistory;
    } else {
      histories.add(newHistory);
    }
    
    _searchHisStreamController.add(histories);
    return _setValue(kSearchHisCollectionKey, json.encode(histories));
  }

  @override
  Future<void> deleteAll() async {
    var cart = _searchHisStreamController.value;
    cart = [];
    return _setValue(kSearchHisCollectionKey, json.encode(cart));
  }

  @override
  Stream<List<SearchHistoryModel>> getSearchHistory() =>
      _searchHisStreamController.asBroadcastStream();
}
