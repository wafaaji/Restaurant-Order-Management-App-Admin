import 'package:admin/components/customGridProfile.dart';
import 'package:admin/modules/employees/employeesController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class employeesScreen extends GetView<EmployeesController> {

  @override
  Widget build(BuildContext context) {
    print(controller.employeesList);
    print(controller.allEmployees);
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Color(0xFFBE0B0B),));
        }
        return RefreshIndicator(
            onRefresh: controller.fetchData,
            color: Color(0xFFBE0B0B),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFBE0B0B),)
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
              child: GridView.builder(
                  itemCount: controller.allEmployees.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.3,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    final employees = controller.allEmployees[index];
                    return GestureDetector(
                      child: CustomGridProfile(
                        name: employees.name,
                        email: employees.email,
                        phone: employees.phone.toString(),
                        location: employees.location,
                      ),
                    );
                  }
              ),
            ),
          ),
        );
      }),
    );
  }

}
