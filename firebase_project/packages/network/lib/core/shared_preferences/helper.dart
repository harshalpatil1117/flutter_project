import 'dart:async';

import 'package:network/core/shared_preferences/preferences.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference;

  const SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------

  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreference.setString(PrefKeys.authToken, authToken);
  }

  String? get authToken {
    return _sharedPreference.getString(PrefKeys.authToken);
  }

  Future<void> saveUserId(int userId) async {
    await _sharedPreference.setInt(PrefKeys.userId, userId);
  }

  int? get userId {
    return _sharedPreference.getInt(PrefKeys.userId);
  }

  Future<void> saveCompanyName(String companyName) async {
    await _sharedPreference.setString(PrefKeys.companyName, companyName);
  }

  String? get companyName {
    return _sharedPreference.getString(PrefKeys.companyName);
  }
  Future<void> saveLoginUserName(String loginUsername) async {
    await _sharedPreference.setString(PrefKeys.loginUsername, loginUsername);
  }

  String? get loginUserName {
    return _sharedPreference.getString(PrefKeys.loginUsername);
  }

  Future<void> saveUserName(String userName) async {
    await _sharedPreference.setString(PrefKeys.userName, userName);
  }

  String? get userName {
    return _sharedPreference.getString(PrefKeys.userName);
  }

  Future<void> savePassword(String password) async {
    await _sharedPreference.setString(PrefKeys.password, password);
  }

  String? get password {
    return _sharedPreference.getString(PrefKeys.password);
  }

  Future<void> saveCompanyId(int companyId) async {
    await _sharedPreference.setInt(PrefKeys.companyId, companyId);
  }

  int? get companyId {
    return _sharedPreference.getInt(PrefKeys.companyId);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(PrefKeys.authToken);
  }

  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }

  Future<void> saveLanguageCode(String langCode) async {
    switch (langCode) {
      case 'ar':
        await _sharedPreference.setString(
            PrefKeys.languageCode, AppLocal.ar.name);
        break;
      case 'en':
        await _sharedPreference.setString(
            PrefKeys.languageCode, AppLocal.en.name);
        break;
      default:
        await _sharedPreference.setString(
            PrefKeys.languageCode, AppLocal.en.name);
    }
  }

  String? get languageCode {
    final langCode = _sharedPreference.getString(PrefKeys.languageCode);
    switch (langCode) {
      case "en":
        return AppLocal.en.name;
      case "ar":
        return AppLocal.ar.name;
      default:
        return AppLocal.en.name;
    }
  }
}

mixin PrefKeys {
  static const String isLoggedIn = "isLoggedIn";
  static const String authToken = "authToken";
  static const String languageCode = 'languageCode';
  static const String userId = 'userId';
  static const String companyId = 'companyId';
  static const String companyName = 'companyName';
  static const String userName = 'userName';
  static const String password = 'password';
  static const String loginUsername = 'loginUsername';



}

enum AppLocal { en, ar }
