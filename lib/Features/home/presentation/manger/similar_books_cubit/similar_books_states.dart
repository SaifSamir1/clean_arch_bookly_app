
import 'package:flutter/material.dart';

import '../../../../../core/entities/book_entity.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}



class SimilarBooksPaginationLoading extends SimilarBooksState {}
class SimilarBooksPaginationFailure extends SimilarBooksState
{
  final String errorMessage;

  SimilarBooksPaginationFailure(this.errorMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}