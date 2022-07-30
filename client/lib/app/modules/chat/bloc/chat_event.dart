part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started(String anotherID) = _Started;
  const factory ChatEvent.sendMessage(String data) = _SendMessage;
}
