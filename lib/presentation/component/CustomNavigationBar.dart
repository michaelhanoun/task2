import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/presentation/controller/ECommerceCubit.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: index,
        selectedItemColor: Colors.black,
        onTap: ((value) {
          BlocProvider.of<ECommerceCubit>(context).getscreen(value);
        }));
  }
}
