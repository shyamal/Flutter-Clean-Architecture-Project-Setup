import 'package:dartz/dartz.dart';
import 'package:employee_info/core/error.dart';
import 'package:employee_info/feature/home/data/data_source/home_data_source.dart';
import 'package:employee_info/feature/home/data/model/employee_response_model.dart';
import 'package:employee_info/feature/home/domain/entity/employee_entity.dart';
import 'package:employee_info/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<Either<Failure, EmployeeListEntity>> getEmployeeList() async =>
      homeDataSource.getEmployeeList();
}
