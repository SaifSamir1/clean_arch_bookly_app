import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({required String mainBooks,int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({required String mainBooks,int pageNumber = 0 });
  List<BookEntity> fetchSimilarBooks({required String category,int pageNumber = 0});

}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks({required String mainBooks,int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex > length)
      {
        return [];
      }
      return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({required String mainBooks,int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex > length)
    {
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category, int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kSimilarBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex > length)
    {
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }


}
