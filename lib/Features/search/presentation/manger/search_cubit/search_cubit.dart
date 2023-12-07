import 'package:bookly/Features/search/domain/use_cases/searched_books_use_case.dart';
import 'package:bookly/Features/search/presentation/manger/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchedBooksUseCase) : super(SearchBooksInitial());

  final SearchedBooksUseCase searchedBooksUseCase;

  Future<void> fetchSearchBooks({required String searchedBook,int pageNumber =0})async
  {
    if(pageNumber == 0)
    {
      emit(SearchBooksLoading());
    }
    else {
      emit(SearchBooksPaginationLoading());
    }
    var result =await searchedBooksUseCase.call(pageNumber,searchedBook);
    result.fold((failure) {
      if(pageNumber ==0){
        emit(SearchBooksFailure(failure.message));
      }
      else {
        emit(SearchBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}