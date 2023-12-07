








import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/entities/book_entity.dart';
import '../../domain/repos/search_repo.dart';
import '../dataSource/search_local_data_source.dart';
import '../dataSource/search_remote_data_source.dart';



class SearchedRepoImpl implements SearchRepo{

  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchedRepoImpl({required this.searchRemoteDataSource,required this.searchLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBook({required String searchedBook, int pageNumber = 0}) async{
    try {
      List<BookEntity> savedBooks;
      savedBooks = searchLocalDataSource.fetchSearchedBook(searchedBook: searchedBook,pageNumber:pageNumber);
      if (savedBooks.isNotEmpty) {
        return right(savedBooks);
      }
      savedBooks = await searchRemoteDataSource.fetchSearchedBook(searchedBook: searchedBook,pageNumber:pageNumber);
      return right(savedBooks);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }


}