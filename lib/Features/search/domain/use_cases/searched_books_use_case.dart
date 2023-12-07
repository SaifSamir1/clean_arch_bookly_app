







import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/search_repo.dart';

class SearchedBooksUseCase extends UseCase<List<BookEntity>,int,String>
{
  final SearchRepo searchRepo;

  SearchedBooksUseCase(this.searchRepo);

  @override
  //ال parameter هو ال page number
  Future<Either<Failure, List<BookEntity>>> call([int parameter = 0,String? parameter2]) async{
    return await searchRepo.fetchSearchedBook(
      pageNumber: parameter,
      searchedBook: parameter2 ?? '',
    );
  }
}
