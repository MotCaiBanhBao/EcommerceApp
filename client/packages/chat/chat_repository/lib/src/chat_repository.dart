import 'package:chat_api/chat_api.dart';

class ChatRepository {
  /// {@macro todos_repository}
  const ChatRepository({
    required ChatApi chatApi,
  }) : _chatApi = chatApi;

  final ChatApi _chatApi;

  Stream<List<MessageModel>> loadMessagesOnNoti(String messageId) =>
      _chatApi.loadMessagesOnNoti(messageId);

  Future<Map<String, String>?> getRoomId(String anotherUser) =>
      _chatApi.getRoomId(anotherUser);

  Future<void> pushMessage(
          String messageId, MessageModel message, String anotherUser) =>
      _chatApi.pushMessage(messageId, message, anotherUser);
}
