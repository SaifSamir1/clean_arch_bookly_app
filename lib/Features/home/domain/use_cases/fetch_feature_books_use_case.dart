



import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>,int,String>
{
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  //ال parameter هو ال page number
  Future<Either<Failure, List<BookEntity>>> call([int parameter = 0,String? parameter2]) async{
    return await homeRepo.fetchFeatureBooks(
      pageNumber: parameter,
      mainBooks: parameter2 ??''
    );
  }
}
