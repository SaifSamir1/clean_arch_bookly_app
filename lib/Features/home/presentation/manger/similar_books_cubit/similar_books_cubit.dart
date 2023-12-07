import 'package:bookly/Features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_similar_books_use_case.dart';


class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category,int pageNumber =0})async
  {
    if(pageNumber == 0)
    {
      emit(SimilarBooksLoading());
    }
    else {
      emit(SimilarBooksPaginationLoading());
    }
    var result =await fetchSimilarBooksUseCase.call(pageNumber,category);
    result.fold((failure) {
      if(pageNumber ==0){
        emit(SimilarBooksFailure(failure.message));
      }
      else {
        emit(SimilarBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}