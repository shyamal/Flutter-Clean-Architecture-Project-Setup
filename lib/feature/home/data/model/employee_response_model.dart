import 'package:employee_info/feature/home/domain/entity/employee_entity.dart';

class EmployeeListModel extends EmployeeListEntity {
  const EmployeeListModel({
    final List<EmployeeModel>? employees}
      )
      : super(employees: employees);

  factory EmployeeListModel.fromJson(Map<dynamic, dynamic> json) {
    var employees = <EmployeeModel>[];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        employees.add(EmployeeModel.fromJson(v));
      });
    }

    return EmployeeListModel(
      employees: employees,
    );
  }
}

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    final int? id,
    final String? name,
    final int? age,
    final String? designation,
    final int? salary,
  }) : super(
            id: id,
            name: name,
            age: age,
            designation: designation,
            salary: salary);

  factory EmployeeModel.fromJson(Map<dynamic, dynamic> json) {
    return EmployeeModel(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      designation: json["designation"],
      salary: json["salary"],
    );
  }
}
