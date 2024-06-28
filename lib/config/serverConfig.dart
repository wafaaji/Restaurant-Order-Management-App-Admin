class ServerConfig {

  //172.20.30.82
  //192.168.1.109
  //172.20.30.149
  //192.168.1.134
  //192.168.43.5

  static const domainNameServer = "http://192.168.1.109:8000/api/admin";

  static const login = "http://192.168.1.109:8000/api/login";
  static const displayRestaurants = "/displayAllRestaurant?status=2";
  static const displayWaitingRestaurants = "/displayAllRestaurant?status=0";
  static const displayRejectRestaurants = "/displayAllRestaurant?status=1";
  static const setPay = "/setPayRestaurant";
  static const acceptRestaurant = "/acceptRestaurant";
  static const rejectRestaurant = "/rejectRestaurant";
  static const displayManagers = "/displayManagers";
  static const displayEmployees = "/displayEmployees";
  static const displayUsers = "/displayUsers";
  static const displayBlockedUsers = "/displayblockedUsers";
  static const blockUser = "/blockUser";
  static const unblockUser = "/unblockUser";

}