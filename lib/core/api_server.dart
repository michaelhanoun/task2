import 'package:dio/dio.dart';
import 'package:task2/core/error/exception.dart';
import 'package:task2/core/network/error_message_model.dart';
import 'package:task2/data/modules/product_model.dart';
import 'package:task2/domain/entites/product.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<List<Product>> get_data(String path) async {
    final response = await dio.get(path);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List<ProductModel> x =
          (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
      print(x.length);
      x.map((e) => print(e.id));
      return x;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
