import 'model/message.dart';

abstract class ChatApi {
  Stream<List<MessageModel>> loadMessagesOnNoti(String messageId);
  Future<Map<String, String>?> getRoomId(String anotherUser);
  Future<void> pushMessage(
      String messageId, MessageModel message, String anotherUser);
}
