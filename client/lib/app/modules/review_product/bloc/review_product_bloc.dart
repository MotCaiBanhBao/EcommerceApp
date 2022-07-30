import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:products_repository/products_repository.dart';

part 'review_product_event.dart';
part 'review_product_state.dart';
part 'review_product_bloc.freezed.dart';

class ReviewProductBloc extends Bloc<ReviewProductEvent, ReviewProductState> {
  ReviewProductBloc(this._productsRepository, this.productID)
      : super(_Initial()) {
    on<_Submit>(_onSubmit);
  }

  Future<void> _onSubmit(_Submit event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ReviewProductStatus.loading));

      await _productsRepository
          .pushReview(event.comment, event.star, productID)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: ReviewProductStatus.failure));
        } else {
          emit(state.copyWith(status: ReviewProductStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ReviewProductStatus.failure));
    }
  }

  final String productID;

  final ProductsRepository _productsRepository;
}
