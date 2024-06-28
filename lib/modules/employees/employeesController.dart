import 'package:admin/model/EmployeesModel.dart';
import 'package:admin/modules/employees/displayEmployeesService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get.dart';

class EmployeesController extends GetxController {

  var message;

  //for display employees
  late DisplayEmployeesService serviceDisplay;
  var employeesList = <Employees>[].obs;
  late List<Employees> allEmployees= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  @override
  void onInit() {
    serviceDisplay = DisplayEmployeesService();
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allEmployees = await serviceDisplay.displayEmployees(token);
    employeesList.value = allEmployees;
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    allEmployees = await serviceDisplay.displayEmployees(token);
    employeesList.value = allEmployees;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }


}
