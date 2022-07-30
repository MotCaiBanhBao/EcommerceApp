import 'package:search_history_api/search_history_api.dart';

class SearchHisRepo {
  /// {@macro todos_repository}
  const SearchHisRepo({
    required this.searchHisApi,
  });

  final SearchHistoryApi searchHisApi;

  Stream<List<SearchHistoryModel>> getSearchHistory() =>
      searchHisApi.getSearchHistory();
  Future<void> addSearchHistory(String data) =>
      searchHisApi.addSearchHistory(data);
  Future<void> deleteAll() => searchHisApi.deleteAll();
}
