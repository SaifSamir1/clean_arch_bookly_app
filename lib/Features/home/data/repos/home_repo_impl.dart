import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/entities/book_entity.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource,required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks({required String mainBooks ,int pageNumber =0 }) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks(mainBooks: mainBooks,pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeatureBooks(mainBooks: mainBooks ,pageNumber: pageNumber);
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({required String mainBooks,int pageNumber =0 }) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks(mainBooks: mainBooks,pageNumber:pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks(mainBooks: mainBooks,pageNumber:pageNumber);
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category, int pageNumber = 0})async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchSimilarBooks(category: category,pageNumber:pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchSimilarBooks(category: category,pageNumber:pageNumber);
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
