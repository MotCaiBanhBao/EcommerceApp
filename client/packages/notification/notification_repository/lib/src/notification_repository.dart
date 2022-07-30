import 'package:notification_api/notification_api.dart';

class NotificationRepository {
  const NotificationRepository({
    required NotificationApi notificationApi,
  }) : _notificationApi = notificationApi;

  final NotificationApi _notificationApi;

  Future<MessageModel?> getChatNotification() =>
      _notificationApi.getChatNotification();
}
