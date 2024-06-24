import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/domain/entites/cart_product.dart';
import 'package:task2/domain/entites/product.dart';
import 'package:task2/presentation/controller/CartCubit.dart';
import 'package:task2/presentation/controller/HomeCubit.dart';
import 'package:task2/presentation/controller/HomeCubitStates.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<CartProducts> p = [];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products;
    return BlocBuilder<HomeCubit, HomeCubitStates>(
      builder: (context, state) {
        if (state is SuccesState) {
          products = state.product;
          return Padding(
            padding: const EdgeInsets.fromLTRB(0.8, 0, 0.8, 0),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Products(products: products[index]);
                },
                itemCount: products.length),
          );
        } else if (state is FailState) {
          return const Center(child: Text("somthing went wrong"));
        } else {
          BlocProvider.of<HomeCubit>(context).getData();
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// ignore: must_be_immutable
class Products extends StatelessWidget {
  Product products;
  Products({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 5)),
        height: MediaQuery.of(context).size.height / 5,
        width: double.infinity,
        child: Row(
          children: [
            Image.network(
              width: MediaQuery.of(context).size.width / 2,
              products.image,
              fit: BoxFit.fitHeight,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${products.title}\n",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: Text(
                        products.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Text(
                              "${products.price}\$",
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 10,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<CartCubit>(context)
                                    .add(products);
                              },
                              child: const Text("Add"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
