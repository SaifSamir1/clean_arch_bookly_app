import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import '../../../../core/entities/book_entity.dart';
import '../../../../core/models/book_model/book_model.dart';
import '../../../../core/utils/functions/saveing_books_data.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBook({required String searchedBook,int pageNumber = 0});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchedBook({required String searchedBook, int pageNumber = 0})async {
    var data = await apiService.get(
        endPoint:
        //هنا ال url مختلف لاننا ضفنا عليه Sorting=relevance ودي argument زياده هبعتها ف الطلب بتاعي علشان
        'volumes?Filtering=free-ebooks&Sorting=newest&q=$searchedBook&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSearchedBox);
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
