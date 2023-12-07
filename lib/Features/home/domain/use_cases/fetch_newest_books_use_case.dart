



import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,int,String>
{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int parameter = 0,String? parameter2]) async{
    return await homeRepo.fetchNewestBooks(
      pageNumber: parameter,
      mainBooks: parameter2 ?? ''
    );
  }
}
