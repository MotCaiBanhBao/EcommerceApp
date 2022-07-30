part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) Languages? language,
    @Default(Theme) theme,
  }) = _Initial;
}
