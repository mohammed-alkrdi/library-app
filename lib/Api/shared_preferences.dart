import 'package:my_library/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', user.userId);
    prefs.setString('name', user.name);
    prefs.setString('age', user.age);
    prefs.setInt('phone_number', user.phoneNumber);
    prefs.setString('email', user.email);
    prefs.setString('password', user.password);
    prefs.setString('token', user.token);


    return prefs.commit();
  }


  getUser () {
    Future<User> getUser () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      int userId = prefs.getInt("userId")!;
      String name = prefs.getString("name")!;
      String age = prefs.getString("age")!;
      int phoneNumber = prefs.getInt("phone_number")!;
      String email = prefs.getString("email")!;
      String password = prefs.getString("password")!;
      String token = prefs.getString("token")!;

      return User(
        userId: userId,
        name: name,
        age: age,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        token: token,

      );
    }

    }

    void removeUser() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.remove('userId');
      prefs.remove('name');
      prefs.remove('age');
      prefs.remove('phone_number');
      prefs.remove('email');
      prefs.remove('password');
      prefs.remove('token');

    }

    Future<String?> getToken() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      return token;
    }
  }
