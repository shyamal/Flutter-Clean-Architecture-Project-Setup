import 'package:dartz/dartz.dart';
import 'package:employee_info/core/error.dart';

import '../entity/employee_entity.dart';

abstract class HomeRepository {
    Future<Either<Failure,EmployeeListEntity>> getEmployeeList();
}