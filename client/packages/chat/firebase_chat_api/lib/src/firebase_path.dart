class FirebasePath {
  static const messageKEY = "messages";

  static String messagePath(String messageID) =>
      'messages/$messageID/messagesData';
  static String messageSavePath(String messageID, String newMessID) =>
      'messages/$messageID/messagesData/$newMessID';
}
