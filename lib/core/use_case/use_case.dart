import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type,Parameters>
{
  Future<Either<Failure,Type>> call([Parameters parameters]);
}
class NoParameter{
  //عملت ال class دي علشان لو
  // ال use case دي مفيهاش parameter هستقبلها وابعتها لل call method
}