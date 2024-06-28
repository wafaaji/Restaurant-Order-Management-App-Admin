import 'package:admin/model/dataModel.dart';
import 'package:admin/model/unblockUser.dart';
import 'package:admin/model/usersModel.dart';
import 'package:admin/modules/block-users/displayBlockedUsersService.dart';
import 'package:admin/modules/block-users/unblockUserService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class BlockUsersController extends GetxController{

  var message;

  //for display block Users
  late DisplayBlockedUsersService serviceDisplay;
  var blockUsersList = <Data>[].obs;
  late List<Data> allBlockUsers= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // for unblock user
  late UnblockUserService unblockUserService;
  var unblockUserStatus;


  @override
  void onInit() {
    serviceDisplay = DisplayBlockedUsersService();

    unblockUserService = UnblockUserService();
    unblockUserStatus = false;
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allBlockUsers = await serviceDisplay.displayBlockedUsers(token);
    blockUsersList.value = allBlockUsers;
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> unblockUserOnClick(Users users) async{
    UnblockUsers unblockUsers = UnblockUsers(
      id: users.id,
    );
    unblockUserStatus = await unblockUserService.unblockUser(unblockUsers);
    message = unblockUserService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  Future<void> updateUserList() async {
    isLoading.value = true;
    blockUsersList.clear();

    var token = await storage.read("token");
    allBlockUsers = await serviceDisplay.displayBlockedUsers(token);
    blockUsersList.value = allBlockUsers;

    isLoading.value = false;
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    allBlockUsers = await serviceDisplay.displayBlockedUsers(token);
    blockUsersList.value = allBlockUsers;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }



}