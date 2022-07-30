import 'history.dart';

class Rate {
  History? history;
  num? totalRate;

  Rate({this.history, this.totalRate});

  Rate.fromJson(Map<String, dynamic> json) {
    history =
        json['history'] != null ? History.fromJson(json['history']) : null;
    totalRate = json['totalRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (history != null) {
      data['history'] = history!.toJson();
    }
    data['totalRate'] = totalRate;
    return data;
  }
}
