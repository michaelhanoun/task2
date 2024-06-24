import 'package:dio/dio.dart';
import 'package:task2/core/api_server.dart';
import 'package:task2/domain/entites/product.dart';

abstract class BaseProductRemoteDataSource {
  Future<List<Product>> getProducts();
}

class RemoteDataSource extends BaseProductRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<List<Product>> getProducts() async {
    ApiService api_service = ApiService(dio);
    dynamic data =
        await api_service.get_data("https://fakestoreapi.com/products");

    return data;
  }
}
