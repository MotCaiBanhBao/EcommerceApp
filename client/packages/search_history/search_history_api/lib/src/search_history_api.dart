import 'package:search_history_api/search_history_api.dart';

abstract class SearchHistoryApi {
  const SearchHistoryApi();
  Stream<List<SearchHistoryModel>> getSearchHistory();
  Future<void> addSearchHistory(String data);
  Future<void> deleteAll();
}
