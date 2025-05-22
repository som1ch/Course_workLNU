import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  late final SharedPreferences _prefs;

  LocalDataSource() {
    _prefs = SharedPreferences.getInstance() as SharedPreferences;
  }

  void saveUserData(String login, String password) async {
    await _prefs.setString('login', login);
    await _prefs.setString('password', password);
  }

  String? getUserLogin() {
    return _prefs.getString('login');
  }

  String? getUserPassword() {
    return _prefs.getString('password');
  }

  void clearUserData() async {
    await _prefs.remove('login');
    await _prefs.remove('password');
  }

  void saveTaskData(String title, String description) async {
    await _prefs.setString('title', title);
    await _prefs.setString('description', description);
  }

  void clearTaskData() async {
    await _prefs.remove('title');
    await _prefs.remove('description');
  }
}
