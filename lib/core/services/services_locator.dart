import 'package:get_it/get_it.dart';
import 'package:task2/domain/usecase/get_products.dart';
import 'package:task2/presentation/controller/HomeCubit.dart';
import 'package:task2/domain/repository/base_repository.dart';
import 'package:task2/data/repository/data_repository.dart';
import 'package:task2/data/data_source/remote_source/remote_data_source.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    getIt.registerFactory(() => HomeCubit(getIt()));

    getIt.registerLazySingleton(() => GetProduct(getIt()));

    getIt.registerLazySingleton<BaseRepository>(() => DataRepository(getIt()));

    getIt.registerLazySingleton<BaseProductRemoteDataSource>(
        () => RemoteDataSource());
  }
}
