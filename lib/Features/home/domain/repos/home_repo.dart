



import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';

abstract class HomeRepo{

  Future<Either<Failure,List<BookEntity>>> fetchFeatureBooks({required String mainBooks,int pageNumber = 0 });
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks({required String mainBooks,int pageNumber = 0 });
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category,int pageNumber = 0 });
}