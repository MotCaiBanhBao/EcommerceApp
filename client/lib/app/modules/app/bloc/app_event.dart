part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.started() = _Started;
  const factory AppEvent.changeLanguage(Languages language) = _ChangeLanguage;
  const factory AppEvent.onConnected() = _OnConnected;
  const factory AppEvent.onDisConnected() = _OnDisConnected;
  const factory AppEvent.onNotification(String payload) = _OnNotification;
  const factory AppEvent.onNotificationError(String error) =
      _OnNotificationError;
}
