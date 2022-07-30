import 'dart:convert';

import 'package:api_util/api_util.dart';
import 'package:chat_api/chat_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_api/src/firebase_path.dart';
import 'package:firebase_chat_api/src/firestore_server.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';

class FirebaseChatApi extends ChatApi {
  final _firestoreService = FirestoreService.instance;

  @override
  Stream<List<MessageModel>> loadMessagesOnNoti(String messageId) {
    print(FirebasePath.messagePath(messageId));
    return _firestoreService.collectionStream(
      path: FirebasePath.messagePath(messageId),
      builder: (data, documentId) => MessageModel.fromMap(data),
      sort: (a, b) {
        return b.timeStamp.compareTo(a.timeStamp);
      },
    );
  }

  @override
  Future<void> pushMessage(
      String messageId, MessageModel message, String anotherUser) async {
    // final reference = FirebaseFirestore.instance.doc('test/aaaa');
    // // print('$path: $data');
    // await reference.set(message.toMap(), SetOptions(merge: true));

    try {
      final data = await LocalStorageAuthApi().getToken();
      print('ccc');
      if (data == null) {
        return null;
      } else {
        await _firestoreService
            .set(
          path: FirebasePath.messageSavePath(messageId, message.id),
          data: message.toMap(),
        )
            .then((value) async {
          String url = ApiHelper.baseURI + ApiEndPoints.pushChatUri;
          var options = apiUtils.makeSecureHeaders(data);
          var response = await apiUtils.post(
              url: url,
              data: {
                'anotherId': anotherUser,
                'chatData': message.content,
                'chatId': messageId
              },
              options: options);
          if (response.statusCode == CODE_SUCCESS) {
            return response.data;
          }
          return null;
        });
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<Map<String, String>?> getRoomId(String anotherUser) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      print('ccc');
      if (data == null) {
        return null;
      } else {
        print('dddd');
        String url = ApiHelper.baseURI + ApiEndPoints.getRoomChatUri;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.post(
            url: url, data: {'anotherId': anotherUser}, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          print('eeee');
          return Map<String, String>.from(result.data);
        }
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
