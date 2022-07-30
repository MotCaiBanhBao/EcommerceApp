class ReviewData {
  int? rate;
  String? comment;
  String? senderId;
  String? id;

  ReviewData({this.rate, this.comment, this.id, this.senderId});

  ReviewData.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    comment = json['comment'];
    senderId = json['id'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rate'] = rate;
    data['comment'] = comment;
    data['id'] = senderId;
    data['_id'] = id;
    return data;
  }
}
