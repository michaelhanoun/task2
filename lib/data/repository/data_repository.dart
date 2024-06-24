import 'package:either_dart/src/either.dart';
import 'package:task2/core/network/failure.dart';
import 'package:task2/data/data_source/remote_source/remote_data_source.dart';
import 'package:task2/domain/entites/product.dart';
import 'package:task2/domain/repository/base_repository.dart';

class DataRepository extends BaseRepository {
  BaseProductRemoteDataSource baseProductRemoteDataSource;
  DataRepository(this.baseProductRemoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProduct() async {
    try {
      return Right(await baseProductRemoteDataSource.getProducts());
    } catch (e) {
      return const Left(Failure("There is an error"));
    }
  }
}
