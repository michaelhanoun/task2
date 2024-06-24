import 'package:either_dart/either.dart';
import 'package:task2/domain/entites/product.dart';

import '../../core/network/failure.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<Product>>> getProduct();
}
