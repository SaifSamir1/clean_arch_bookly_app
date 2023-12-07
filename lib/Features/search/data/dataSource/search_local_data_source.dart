import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/entities/book_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchedBook({required String searchedBook,int pageNumber = 0});

}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {

  @override
  List<BookEntity> fetchSearchedBook({required String searchedBook, int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kSearchedBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex > length)
    {
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }
}
