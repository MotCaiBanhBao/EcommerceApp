import 'package:auth_api/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._chatRepo, this.anotherUser) : super(_Initial()) {
    print('ddd');
    on<_Started>(_onStarted);
    on<_SendMessage>(_onSendMessage);
  }

  final ChatRepository _chatRepo;
  final anotherUser;
  Future<void> _onSendMessage(
      _SendMessage event, Emitter<ChatState> emit) async {
    try {
      await _chatRepo
          .pushMessage(
              state.roomId,
              MessageModel(userID: state.userId, content: event.data),
              anotherUser)
          .then((value) {});
    } catch (err) {}
  }

  Future<void> _onStarted(_Started event, Emitter<ChatState> emit) async {
    try {
      await _chatRepo.getRoomId(event.anotherID).then((value) {
        if (value == null) {
          emit(state.copyWith(status: ChatStatus.failure));
        } else {
          print(value);
          final stream = _chatRepo.loadMessagesOnNoti(value['room']!);
          emit(state.copyWith(
              anotherId: event.anotherID,
              roomId: value['room']!,
              chatData: stream,
              userId: value['user']!));
        }
      });
    } catch (err) {}
  }
}
