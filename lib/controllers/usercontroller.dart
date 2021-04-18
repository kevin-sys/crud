import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController
{
  Future<http.Response> addDataUser(String nameController,
     String emailController, String addressController) async {
    var url = Uri.parse('http://localhost:8080/addUser');

    Map data = {
      'name': '$nameController',
      'email': '$emailController',
      'address': '$addressController',

    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //function for update USER
  Future<http.Response> editUser(String id, String nameController,
      String emailController, String addressController) async {
    int usernew = int.parse(id);
   // int usernew = id;
    print(usernew);
    var url = Uri.parse('http://localhost:8080/update');

    Map data = {
      'id': '$usernew',
      'name': '$nameController',
      'email': '$emailController',
      'address': '$addressController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Future<http.Response> DeleteUser(String id) async {
    int userdelete = int.parse(id);
   // int userdelete = id;
    print(userdelete);
    var url = Uri.parse('http://localhost:8080/delete/$userdelete');
    var response =
    await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
}