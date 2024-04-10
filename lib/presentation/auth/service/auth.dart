import 'package:devy_boiler_plate/manager/network/api_manager.dart';
import 'package:devy_boiler_plate/model/response.dart';
import 'package:devy_boiler_plate/manager/local_storage/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier, DiagnosticableTreeMixin {
  bool? loading = false;
  bool? get isLoading => loading;

  Response? response;
  Response? get getResponse => response;

  Map<String, dynamic> registerUser = {};
  Map<String, dynamic> get getRegisterUser => registerUser;

  String? token;
  String? get getToken => token;

  bool isLogin = false;
  bool get getIsLogin => isLogin;

  int selectedPage = 1;
  int get getSelectedPage => selectedPage;

  void setLogin(bool login) {
    isLogin = login;
    notifyListeners();
  }

  Future<bool?> login(
      {required String phoneNumber, required String password}) async {
    final result = await APIManager().requestPost(
        query: QueryUrl.auth,
        extraURl: "/local",
        body: {"identifier": phoneNumber, "password": password});

    if (result!.statusCode == 200) {
      notifyListeners();
      return isLogin;
    }
    return false;
  }

  Future<bool?> register() async {
    final result = await APIManager()
        .requestPost(query: QueryUrl.auth, extraURl: "/local/register", body: {
      "username": registerUser['username'],
      "password": registerUser['password'],
      "email": "${registerUser['username']}@text.com"
    });

    if (result!.statusCode == 200) {
      notifyListeners();
      return isLogin;
    }
    return false;
  }

  Future<void> logout() async {
    SharedPreferencesManager().clearPreference();
    response = null;
    notifyListeners();
  }

  Future<void> setScreen(int screen) async {
    selectedPage = screen;

    notifyListeners();
  }

  Future<void> checkLogin() async {
    isLogin =
        await SharedPreferencesManager().getValue(Store.isLogin) == "true";
    notifyListeners();
  }
}
