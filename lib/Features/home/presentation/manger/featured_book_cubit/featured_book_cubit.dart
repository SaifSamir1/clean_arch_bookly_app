import 'package:bookly/Features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_book_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featureBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeatureBooksUseCase featureBooksUseCase;

  Future<void> fetchFeaturedBooks({required String mainBooks,int pageNumber = 0})async
  {
    if(pageNumber == 0)
      {
        emit(FeaturedBooksLoading());
      }
    else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result =await featureBooksUseCase.call(pageNumber,mainBooks);
    result.fold((failure) {
      if(pageNumber ==0){
        emit(FeaturedBooksFailure(failure.message));
      }
      else {
        emit(FeaturedBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}