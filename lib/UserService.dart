import 'package:bluepad_app/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> login(username, password) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<User> users = getUsers();
    List<User> userList = users.where(
        (user) => user.username == username && user.password == password).toList();
    if (userList.length > 0) {
      prefs.setString("user", userList[0].firstName);
      return true;
    }
    return false;
  }

  Future<String> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user");
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
     prefs.remove("user");
    return true;
  }
}
