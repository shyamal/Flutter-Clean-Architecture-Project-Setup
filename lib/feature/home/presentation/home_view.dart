import 'package:employee_info/feature/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState


    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.actionGetEmployee();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        excludeHeaderSemantics: true,
        title: const Text(
          "Employee Info",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<HomeController>(
          id: "EmployeeList",
          assignId: true,
          builder: (logic) {
            return ListView.builder(
                itemCount: logic.employeeList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(10)),

                    child: ListTile(
                      onTap: () {
                        logic.actionSelectUser(index);
                      },
                      leading: SizedBox(
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/150?u=${logic.employeeList[index].name}"),
                          radius: 100,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            logic.employeeList[index].name ?? "-",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            logic.employeeList[index].designation ?? "",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
