import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/domain/entites/product.dart';
import 'package:task2/domain/usecase/get_products.dart';
import 'package:task2/presentation/controller/HomeCubitStates.dart';

class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit(this.getProduct) : super(LoadingState());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Product> products = [];
  final GetProduct getProduct;
  void getData() async {
    emit(LoadingState());
    final result = await getProduct.call();

    result.fold((l) => emit(FailState()), (r) {
      products = r;

      emit(SuccesState(product: products));
    });
  }
}
