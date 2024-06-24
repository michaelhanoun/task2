import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/core/services/services_locator.dart';
import 'package:task2/presentation/component/CustomNavigationBar.dart';
import 'package:task2/presentation/controller/CartCubit.dart';
import 'package:task2/presentation/controller/ECommerceCubit.dart';
import 'package:task2/presentation/controller/ECommerceCubitStates.dart';
import 'package:task2/presentation/controller/HomeCubit.dart';
import 'package:task2/presentation/screens/Cart.dart';
import 'package:task2/presentation/screens/Home.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) {
          return ECommerceCubit();
        })),
        BlocProvider(create: ((context) {
          return getIt<HomeCubit>();
        })),
        BlocProvider(create: ((context) {
          return CartCubit();
        }))
      ],
      child: SafeArea(
        child: BlocBuilder<ECommerceCubit, ECommerceCubitStates>(
          builder: (context, state) {
            if (state is HomeState) {
              return Scaffold(
                  bottomNavigationBar: CustomNavigationBar(index: 0),
                  body: HomeScreen());
            } else if (state is CartState) {
              return Scaffold(
                bottomNavigationBar: CustomNavigationBar(index: 1),
                body: const CartScreen(),
              );
            } else {
              return Scaffold(
                  bottomNavigationBar: CustomNavigationBar(index: 2));
            }
          },
        ),
      ),
    );
  }
}
