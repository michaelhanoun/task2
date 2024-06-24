import 'package:either_dart/src/either.dart';
import 'package:task2/core/network/failure.dart';
import 'package:task2/domain/entites/product.dart';
import 'package:task2/domain/repository/base_repository.dart';
import 'package:task2/domain/usecase/base_usecase.dart';

class GetProduct extends BaseUseCase<List<Product>> {
  BaseRepository baseRepository;
  GetProduct(this.baseRepository);
  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await baseRepository.getProduct();
  }
}
