import 'package:admin/model/blockUserModel.dart';
import 'package:admin/model/usersModel.dart';
import 'package:admin/modules/users/blockUserService.dart';
import 'package:admin/modules/users/displayUsersService.dart';
import 'package:admin/native-services/secureStorage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class UsersController extends GetxController{

  var message;

  //for display Users
  late DisplayUsersService serviceDisplay;
  var usersList = <Users>[].obs;
  late List<Users> allUsers= [];
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // for block user
  late BlockUserService blockUserService;
  var blockUserStatus;


  @override
  void onInit() {
    serviceDisplay = DisplayUsersService();

    blockUserService = BlockUserService();
    blockUserStatus = false;
    super.onInit();
  }

  @override
  void onReady() async{
    var token = await storage.read("token");
    allUsers = await serviceDisplay.displayUsers(token);
    usersList.value = allUsers;
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> blockUserOnClick(Users users) async{
    BlockUsers blockUsers = BlockUsers(
      id: users.id,
    );
    blockUserStatus = await blockUserService.blockUser(blockUsers);
    message = blockUserService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  Future<void> updateUserList() async {
    isLoading.value = true;
    usersList.clear();

    // Fetch the new list of Reservation based on the existing categories
    var token = await storage.read("token");
    allUsers = await serviceDisplay.displayUsers(token);
    usersList.value = allUsers;

    isLoading.value = false;
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    allUsers = await serviceDisplay.displayUsers(token);
    usersList.value = allUsers;
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    isLoading.value = false;
  }


}