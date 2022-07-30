import 'package:api_util/api_util.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';
import 'package:notification_api/notification_api.dart';

class RemoteNotificationApi extends NotificationApi {
  @override
  Future<MessageModel?> getChatNotification() async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return null;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.getNotification;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.get(url: url, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          return MessageModel.fromJson(result.data);
        }
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
