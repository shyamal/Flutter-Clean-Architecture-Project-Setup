import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:employee_info/core/error.dart';
import 'package:employee_info/feature/home/data/data_source/home_data_source.dart';
import 'package:employee_info/feature/home/data/model/employee_response_model.dart';

import '../../../../core/constants.dart';
import '../../../../core/network/network_info.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final http.Client client;
  final NetworkInfo networkInfo;

  HomeDataSourceImpl({
    required this.client,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, EmployeeListModel>> getEmployeeList() async {
    if (await networkInfo.isConnected()) {
      // List<EmployeeModel> employees = [
      //   EmployeeModel(
      //     id: 1,
      //     name: "John Smith",
      //     age: 30,
      //     designation: "Software Engineer",
      //     salary: 5000,
      //   ),
      //   EmployeeModel(
      //     id: 2,
      //     name: "Jane Doe",
      //     age: 35,
      //     designation: "Product Manager",
      //     salary: 8000,
      //   ),
      //   EmployeeModel(
      //     id: 3,
      //     name: "Mike Johnson",
      //     age: 28,
      //     designation: "Data Analyst",
      //     salary: 4500,
      //   ),
      // ];
      // EmployeeListModel employeeListModel =
      //     EmployeeListModel(employees: employees);
      //
      // ///
      // /// If api not worked un comment following line
      // //return right(employeeListModel);

      final uri = Uri.https(
        AppURLPath.baseURL,
        AppURLPath.basePath + AppURLPath.pathEmployee,
      );

      if (kDebugMode) {
        print(uri);
      }

      final http.Response response = await client.get(
        uri,
        // Uri.https(path, '/-'),
      );

      if (kDebugMode) {
        print(response.body);
      }

      var empData = EmployeeListModel.fromJson(json.decode(response.body));

      return right(empData);
    } else {
      List<EmployeeModel> employees = [
        EmployeeModel(
          id: 1,
          name: "John Smith",
          age: 30,
          designation: "Software Engineer",
          salary: 5000,
        ),
        EmployeeModel(
          id: 2,
          name: "Jane Doe",
          age: 35,
          designation: "Product Manager",
          salary: 8000,
        ),
        EmployeeModel(
          id: 3,
          name: "Mike Johnson",
          age: 28,
          designation: "Data Analyst",
          salary: 4500,
        ),
      ];
      EmployeeListModel employeeListModel =
          EmployeeListModel(employees: employees);

      ///
      /// If api not worked un comment following line
      return right(employeeListModel);
    }
  }
}
