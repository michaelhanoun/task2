import 'package:task2/domain/entites/product.dart';

abstract class HomeCubitStates {}

class LoadingState extends HomeCubitStates {}

class FailState extends HomeCubitStates {}

class SuccesState extends HomeCubitStates {
  List<Product> product;
  SuccesState({required this.product});
}
