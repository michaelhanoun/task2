// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/domain/entites/cart_product.dart';
import 'package:task2/presentation/controller/CartCubit.dart';
import 'package:task2/presentation/controller/CartCubitStates.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartProducts> products;
    return BlocBuilder<CartCubit, CartCubitStates>(
      builder: (context, state) {
        products = BlocProvider.of<CartCubit>(context).products;
        if (state is DataState) {
          if (products.isEmpty) {
            return const Center(
                child: Text(
              "No products add",
              style: TextStyle(fontSize: 30),
            ));
          }

          return Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(products[index].p.id.toString()),
                        onDismissed: (direction) {
                          BlocProvider.of<CartCubit>(context).delet(index);
                        },
                        child: Product(
                          products: products[index],
                          index: index,
                        ),
                      );
                    },
                    itemCount: products.length,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Total is :",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "${BlocProvider.of<CartCubit>(context).toatal}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          );
        } else {
          return const Text("somthing went wrong");
        }
      },
    );
  }
}

// ignore: must_be_immutable
class Product extends StatelessWidget {
  CartProducts products;
  int index;
  Product({Key? key, required this.products, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 3)),
        height: MediaQuery.of(context).size.height / 5,
        width: double.infinity,
        child: Row(
          children: [
            Image.network(
              width: MediaQuery.of(context).size.width / 2,
              products.p.image,
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
                        "${products.p.title}\n",
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
                        products.p.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "${products.p.price}\$",
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartCubit>(context)
                                      .addButton(products, index);
                                },
                                icon: const Icon(
                                  Icons.plus_one,
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${products.q}",
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartCubit>(context)
                                      .removeButton(products, index);
                                },
                                icon: const Icon(
                                  Icons.exposure_minus_1_sharp,
                                )),
                          ),
                        ],
                      ),
                    ),
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
