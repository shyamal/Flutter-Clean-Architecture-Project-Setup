import 'package:dartz/dartz.dart';
import 'package:employee_info/core/error.dart';
import 'package:employee_info/feature/home/data/model/employee_response_model.dart';

abstract class HomeDataSource {
  Future<Either<Failure, EmployeeListModel>> getEmployeeList();
}
