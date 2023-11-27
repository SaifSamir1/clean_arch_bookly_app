



import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';

abstract class HomeRepo{

  Future<Either<Failure,List<BookEntity>>> fetchFeatureBooks();
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks();
}