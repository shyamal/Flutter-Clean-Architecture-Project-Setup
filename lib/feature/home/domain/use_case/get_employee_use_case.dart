import 'package:dartz/dartz.dart';
import 'package:employee_info/core/error.dart';
import 'package:employee_info/feature/home/domain/entity/employee_entity.dart';
import 'package:employee_info/feature/home/domain/repository/home_repository.dart';

class GetEmployeeUseCase {
  final HomeRepository homeRepository;

  GetEmployeeUseCase({required this.homeRepository});

  Future<Either<Failure, EmployeeListEntity>> call() async{
    return homeRepository.getEmployeeList();
  }
}
