
import 'package:flutter/material.dart';

import '../../../../../core/entities/book_entity.dart';

@immutable
abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}



class SearchBooksPaginationLoading extends SearchBooksState {}
class SearchBooksPaginationFailure extends SearchBooksState
{
  final String errorMessage;

  SearchBooksPaginationFailure(this.errorMessage);
}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess(this.books);
}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure(this.errMessage);
}