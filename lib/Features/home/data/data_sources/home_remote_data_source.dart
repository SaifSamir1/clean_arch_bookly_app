import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import '../../../../core/entities/book_entity.dart';
import '../../../../core/models/book_model/book_model.dart';
import '../../../../core/utils/functions/saveing_books_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks({required String mainBooks,int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({required String mainBooks,int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category ,int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks({required String mainBooks,int pageNumber = 0 }) async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=other&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books,kFeaturedBox);
    return books;
  }


  @override
  Future<List<BookEntity>> fetchNewestBooks({required String mainBooks,int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=$mainBooks&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category, int pageNumber = 0})async {
    var data = await apiService.get(
        endPoint:
        //هنا ال url مختلف لاننا ضفنا عليه Sorting=relevance ودي argument زياده هبعتها ف الطلب بتاعي علشان
        'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSimilarBox);
    return books;
  }


  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      try{
        books.add(BookModel.fromJson(bookMap));
      }catch (error) {
        books.add(BookModel.fromJson(bookMap));
      }
    }
    return books;
  }

}
