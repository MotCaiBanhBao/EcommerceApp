part of 'check_profile_bloc.dart';

@freezed
class CheckProfileEvent with _$CheckProfileEvent {
  const factory CheckProfileEvent.started(String id) = _Started;
}
