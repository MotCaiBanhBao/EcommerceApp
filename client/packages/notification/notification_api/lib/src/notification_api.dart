import 'package:notification_api/src/model/mode.dart';

abstract class NotificationApi {
  Future<MessageModel?> getChatNotification();
}
