class SearchHistoryModel {
  late String searchData;
  final dateAdd = DateTime.now();

  SearchHistoryModel({required this.searchData});

  SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    searchData = json['search_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['search_data'] = searchData;
    return data;
  }
}
