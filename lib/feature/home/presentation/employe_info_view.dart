import 'package:employee_info/feature/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeInfoView extends StatefulWidget {
  static const routeName = "/home/detail";
  const EmployeeInfoView({Key? key}) : super(key: key);

  @override
  State<EmployeeInfoView> createState() => _EmployeeInfoViewState();
}

class _EmployeeInfoViewState extends State<EmployeeInfoView> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          homeController.selectedEmployee.name ?? "Employee Info",
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?u=${homeController.selectedEmployee.name ?? "-"}"),
              ),
            ),
            Text(
              homeController.selectedEmployee.name ?? "-",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            Text(
              homeController.selectedEmployee.designation ?? "-",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Salary : ${homeController.selectedEmployee.salary ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
