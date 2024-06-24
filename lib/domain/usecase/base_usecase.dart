import 'package:either_dart/either.dart';
import '../../core/network/failure.dart';

abstract class BaseUseCase<Out> {
  Future<Either<Failure, Out>> call();
}
