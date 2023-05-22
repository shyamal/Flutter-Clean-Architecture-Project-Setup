import 'package:employee_info/feature/home/domain/entity/employee_entity.dart';
import 'package:employee_info/feature/home/domain/use_case/get_employee_use_case.dart';
import 'package:employee_info/feature/home/presentation/employe_info_view.dart';
import 'package:get/get.dart';

import '../../../../injector.dart';
import '../../../../widget/loading_widget.dart';

class HomeController extends GetxController {
  GetEmployeeUseCase employeeUseCase =
      GetEmployeeUseCase(homeRepository: sl.call());

  RxList<EmployeeEntity> employeeList = <EmployeeEntity>[].obs;
  EmployeeEntity selectedEmployee = EmployeeEntity();

  @override
  void onInit() async {

    super.onInit();
  }

  ///
  /// Get employee info
  ///
  actionGetEmployee() async {
    LoadingBuilder(Get.context!).showLoading();
    var employess = await employeeUseCase.call();
    LoadingBuilder(Get.context!).hideLoading();

    employess.fold((l) {
      print("---d");
      print(l.toString());
    }, (r) {
      print("---v");
      print(r);
      employeeList.value = r.employees!;
      update(['EmployeeList']);
      //schoolList.value = r.data!;
    });
  }


  actionSelectUser(int index){
    selectedEmployee = employeeList[index];
    Get.toNamed(EmployeeInfoView.routeName);
  }
}
