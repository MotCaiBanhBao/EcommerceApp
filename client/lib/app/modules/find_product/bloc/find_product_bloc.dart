import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_history_api/search_history_api.dart';
import 'package:search_history_repository/search_history_repository.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'find_product_event.dart';
part 'find_product_state.dart';
part 'find_product_bloc.freezed.dart';

class FindProductBloc extends Bloc<FindProductEvent, FindProductState> {
  FindProductBloc(this._searchHisRepo) : super(_Initial()) {
    _searchHisRepo.getSearchHistory().listen((event) {
      add(const FindProductEvent.started());
    });
    on<_Started>(_onSarted);
    on<_GoSearch>(_onGoSearch);
    on<_OpenSpeechToText>(_onOpenSpeechToText);
  }

  Future<void> _onOpenSpeechToText(
      _OpenSpeechToText event, Emitter emit) async {
    emit(state.copyWith(searchData: event.result.trim()));
  }

  Future<void> _onSarted(_Started event, Emitter emit) async {
    emit(state.copyWith(status: FindProStatus.loading));
    await emit.forEach<List<SearchHistoryModel>>(
      _searchHisRepo.getSearchHistory(),
      onData: (searchHistory) {
        searchHistory.sort(((a, b) => b.dateAdd.compareTo(a.dateAdd)));
        return state.copyWith(
          status: FindProStatus.success,
          searchHis: searchHistory,
        );
      },
      onError: (_, __) => state.copyWith(
        status: FindProStatus.failure,
      ),
    );
  }

  Future<void> _onGoSearch(_GoSearch event, Emitter emit) async {
    emit(state.copyWith(status: FindProStatus.loading));

    await _searchHisRepo.addSearchHistory(event.searchData).then((value) =>
        emit(state.copyWith(
            status: FindProStatus.success,
            searchData: event.searchData.trim())));
  }

  final SearchHisRepo _searchHisRepo;
}
