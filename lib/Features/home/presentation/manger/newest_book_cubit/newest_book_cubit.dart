import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

import 'newest_book_states.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({required String mainBooks,int pageNumber = 0}) async {
    if(pageNumber == 0)
    {
      emit(NewestBooksLoading());
    }
    else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber,mainBooks);
    result.fold((failure) {
      if(pageNumber ==0){
        emit(NewestBooksFailure(failure.message));
      }
      else {
        emit(NewestBooksPaginationFailure(failure.message));
      }    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}