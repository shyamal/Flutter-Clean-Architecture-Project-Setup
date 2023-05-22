import 'package:equatable/equatable.dart';

class EmployeeListEntity extends Equatable{
  final List<EmployeeEntity>? employees;

  const EmployeeListEntity({this.employees});

  @override
  // TODO: implement props
  List<Object?> get props => [employees];
}

class EmployeeEntity extends Equatable {
  final int? id;
  final String? name;
  final int? age;
  final String? designation;
  final int? salary;

  const EmployeeEntity({this.id, this.name, this.age, this.designation, this.salary});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, age, designation, salary];

}