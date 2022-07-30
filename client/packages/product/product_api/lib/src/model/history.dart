import 'review_data.dart';

class History {
  int? numberOfReview;
  List<ReviewData>? data;

  History({this.numberOfReview, this.data});

  History.fromJson(Map<String, dynamic> json) {
    numberOfReview = json['numberOfReview'];
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add(ReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numberOfReview'] = numberOfReview;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
