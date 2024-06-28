import 'package:admin/model/managersModel.dart';
import 'package:admin/modules/managers/displayManagersService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get.dart';

class ManagersController extends GetxController {

  var message;

  //for display Managers
  late DisplayManagersService serviceDisplay;
  var managersList = <Managers>[].obs;
  late List<Managers> allManagers= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  @override
  void onInit() {
    serviceDisplay = DisplayManagersService();
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allManagers = await serviceDisplay.displayManagers(token);
    managersList.value = allManagers;
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
    allManagers = await serviceDisplay.displayManagers(token);
    managersList.value = allManagers;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }


}
