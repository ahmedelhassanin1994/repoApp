
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/failure.dart';

abstract class BaseCase<In,Out>{
  Future<Either<Failure,Out>> execute(In input);

}
abstract class BaseCaseAdd<In>{
  Future<void> execute(In input);
}
abstract class BaseCaseVoid{
  Future<void> execute();
}