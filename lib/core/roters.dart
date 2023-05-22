import 'package:employee_info/feature/home/home_binding.dart';
import 'package:employee_info/feature/home/presentation/employe_info_view.dart';
import 'package:employee_info/feature/home/presentation/home_view.dart';
import 'package:get/get.dart';

class Routers {
  static final route = [
    GetPage(
        name: HomeView.routeName,
        page: () => const HomeView(),
        bindings: [HomeBinding()]),
    GetPage(
        name: EmployeeInfoView.routeName,
        page: () => const EmployeeInfoView(),
        bindings: [HomeBinding()])
  ];

}