import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:employee_info/feature/home/data/data_source/home_data_source.dart';
import 'package:employee_info/feature/home/data/data_source/home_data_source_impl.dart';
import 'package:employee_info/feature/home/data/repository/home_repository_impl.dart';
import 'package:employee_info/feature/home/domain/repository/home_repository.dart';
import 'package:employee_info/feature/home/domain/use_case/get_employee_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //controller

  //use cases
  sl.registerLazySingleton<GetEmployeeUseCase>(
      () => GetEmployeeUseCase(homeRepository: sl.call()));

  //repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl.call()));

  //data source
  sl.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(client: sl.call(), networkInfo: sl.call()));

  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl.call()));

  // external

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
