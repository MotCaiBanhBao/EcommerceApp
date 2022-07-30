class MessageModel {
  List<ChatNotifications>? chatNotifications;
  List<OrderNotifications>? orderNotifications;

  MessageModel({this.chatNotifications, this.orderNotifications});

  MessageModel.fromJson(Map<String, dynamic> json) {
    if (json['chat_notifications'] != null) {
      chatNotifications = <ChatNotifications>[];
      json['chat_notifications'].forEach((v) {
        chatNotifications!.add(ChatNotifications.fromJson(v));
      });
    }
    if (json['order_notifications'] != null) {
      orderNotifications = <OrderNotifications>[];
      json['order_notifications'].forEach((v) {
        orderNotifications!.add(OrderNotifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chatNotifications != null) {
      data['chat_notifications'] =
          chatNotifications!.map((v) => v.toJson()).toList();
    }
    if (orderNotifications != null) {
      data['order_notifications'] =
          orderNotifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatNotifications {
  bool? isWatched;
  String? content;
  String? chatID;
  String? anotherID;
  String? dateAdd;

  ChatNotifications(
      {this.isWatched,
      this.content,
      this.chatID,
      this.anotherID,
      this.dateAdd});

  ChatNotifications.fromJson(Map<String, dynamic> json) {
    isWatched = json['is_watched'];
    content = json['content'];
    chatID = json['chatID'];
    anotherID = json['anotherID'];
    dateAdd = json['dateAdd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_watched'] = isWatched;
    data['content'] = content;
    data['chatID'] = chatID;
    data['anotherID'] = anotherID;
    data['dateAdd'] = dateAdd;
    return data;
  }
}

class OrderNotifications {
  String? content;
  String? orderID;
  bool? isWatched;
  String? avatar;
  String? dateAdd;

  OrderNotifications(
      {this.content, this.orderID, this.isWatched, this.avatar, this.dateAdd});

  OrderNotifications.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    orderID = json['orderID'];
    isWatched = json['is_watched'];
    avatar = json['avatar'];
    dateAdd = json['dateAdd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['orderID'] = this.orderID;
    data['is_watched'] = this.isWatched;
    data['avatar'] = this.avatar;
    data['dateAdd'] = this.dateAdd;
    return data;
  }
}
