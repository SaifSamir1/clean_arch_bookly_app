





import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBook({required String searchedBook,int pageNumber = 0});

}
