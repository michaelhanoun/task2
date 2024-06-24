import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/domain/entites/cart_product.dart';
import 'package:task2/domain/entites/product.dart';

import 'package:task2/presentation/controller/CartCubitStates.dart';

class CartCubit extends Cubit<CartCubitStates> {
  List<CartProducts> products = [];
  List<int> id = [];
  double toatal = 0;
  CartCubit() : super(DataState());
  void delet(int x) {
    toatal -= products[x].p.price * products[x].q;
    deletelist(x);
    emit(DataState());
  }

  void deletelist(int x) {
    products.removeAt(x);
    id.removeAt(x);
  }

  void add(Product product) {
    int ri = id.indexOf(product.id);
    if (ri == -1) {
      CartProducts cartProducts = new CartProducts(p: product, q: 1);
      products.add(cartProducts);
      id.add(product.id);
    } else {
      products[ri].q += 1;
    }
    toatal += product.price;
    emit(DataState());
  }

  void addButton(CartProducts product, int index) {
    toatal += product.p.price;
    products[index].q += 1;
    emit(DataState());
  }

  void removeButton(CartProducts product, int index) {
    if (product.q == 1) {
      toatal -= product.p.price;
      deletelist(index);
    } else {
      toatal -= product.p.price;
      products[index].q -= 1;
    }
    emit(DataState());
  }
}
