import 'dart:convert';
import 'package:admin/config/serverConfig.dart';
import 'package:admin/model/EmployeesModel.dart';
import 'package:admin/model/displayEmployeesModel.dart';
import 'package:http/http.dart' as http;

class DisplayEmployeesService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.displayEmployees);

  Future<List<Employees>> displayEmployees(var token) async{
    try {
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${token}",
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        var employees = displayEmployeesFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var employeesList = jsonResponse["data"];
        print("-----------------display employees----------------");
        print(employeesList);

        List<Employees> employeeList = List<Employees>.from(employeesList.map((item) => Employees.fromJson(item)));

        return employeeList;
      } else {
        message = 'Server Error';
        return [];
      }
    } catch (e) {
      print("Exception during logout request: $e");
      message = 'An error occurred';
      return [];
    }

  }


}