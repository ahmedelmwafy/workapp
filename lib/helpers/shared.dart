// ignore_for_file: always_declare_return_types

import 'package:shared_preferences/shared_preferences.dart';

class CashedHelper {
  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setUserToken(value) async {
    return await _sharedPreferences!.setString('access_token', value);
  }

  static String getUserToken() {
    return _sharedPreferences!.getString('access_token') ?? '';
  }

  static Future<bool> setUserType(value) async {
    return await _sharedPreferences!.setString('type', value);
  }

  static String getUserType() {
    return _sharedPreferences!.getString('type') ?? '';
  }

  static Future<bool> setLogin(value) async {
    return await _sharedPreferences!.setBool('login', value);
  }

  static Future<bool> setProductList(value) async {
    return await _sharedPreferences!.setStringList('Id', value);
  }

  static bool getLogin() {
    return _sharedPreferences!.getBool('login') ?? false;
  }

  static Future<bool> setFCMToken(value) async {
    return await _sharedPreferences!.setString('fcm_token', value);
  }

  static String getFCMToken() {
    return _sharedPreferences!.getString('fcm_token') ?? '';
  }

  static Future<bool> setPhone(value) async {
    return await _sharedPreferences!.setString('phone', value);
  }

  static String getPhone() {
    return _sharedPreferences!.getString('phone') ?? '';
  }

  static Future<bool> setRondomNumber(value) async {
    return await _sharedPreferences!.setString('rondom', value);
  }

  static String getRondomNumber() {
    return _sharedPreferences!.getString('rondom') ?? '';
  }

  static Future<bool> setPhoneCoede(value) async {
    return await _sharedPreferences!.setString('phone_code', value);
  }

  static String getPhoneCode() {
    return _sharedPreferences!.getString('phone_code') ?? '';
  }

  static Future<bool> setEmail(value) async {
    return await _sharedPreferences!.setString('email', value);
  }

  static String getEmail() {
    return _sharedPreferences!.getString('email') ?? '';
  }

  static Future<bool> setAddress(value) async {
    return await _sharedPreferences!.setString('address', value);
  }

  static String getAddress() {
    return _sharedPreferences!.getString('address') ?? '';
  }

  static Future<bool> setHand(value) async {
    return await _sharedPreferences!.setString('hand', value);
  }

  static String getHand() {
    return _sharedPreferences!.getString('hand') ?? '';
  }

  static Future<bool> setNard(value) async {
    return await _sharedPreferences!.setString('nard', value);
  }

  static String getNard() {
    return _sharedPreferences!.getString('nard') ?? '';
  }

  static Future<bool> setLang(value) async {
    return await _sharedPreferences!.setString('lang', value);
  }

  static String getLang() {
    return _sharedPreferences!.getString('lang') ?? '';
  }

  static Future<bool> setUserImage(value) async {
    return await _sharedPreferences!.setString('image', value);
  }

  static String getUserImage() {
    return _sharedPreferences!.getString('image') ?? '';
  }

  static Future<bool> setUserCover(value) async {
    return await _sharedPreferences!.setString('cover', value);
  }

  static String getUserCover() {
    return _sharedPreferences!.getString('cover') ?? '';
  }

  static Future<bool> setUserName(value) async {
    return await _sharedPreferences!.setString('user_name', value);
  }

  static String getUserName() {
    return _sharedPreferences!.getString('user_name') ?? '';
  }

  static Future<bool> setSelectBadge(value) async {
    return await _sharedPreferences!.setString('select_badge', value);
  }

  static String getSelectBadge() {
    return _sharedPreferences!.getString('select_badge') ?? '';
  }

  static Future<bool> setUserID(value) async {
    return await _sharedPreferences!.setString('id', value);
  }

  static String getUserID() {
    return _sharedPreferences!.getString('id') ?? '';
  }

  static Future<bool> setCountryId(int value) async {
    return await _sharedPreferences!.setInt('country_id', value);
  }

  static int getCountryId() {
    return _sharedPreferences!.getInt('country_id') ?? 0;
  }

  static Future<bool> setTotalCoins(int value) async {
    return await _sharedPreferences!.setInt('total_coins', value);
  }

  static int getTotalCoins() {
    return _sharedPreferences!.getInt('total_coins') ?? 0;
  }

  static Future<bool> setFlagName(value) async {
    return await _sharedPreferences!.setString('flagName', value);
  }

  static String getFlagName() {
    return _sharedPreferences!.getString('flagName') ?? '';
  }

  static Future<bool> setFlagImage(value) async {
    return await _sharedPreferences!.setString('flagImage', value);
  }

  static String getFlagImage() {
    return _sharedPreferences!.getString('flagImage') ?? '';
  }

  static Future<bool> setphoneCode(value) async {
    return await _sharedPreferences!.setString('phone_code', value);
  }

  static String getphoneCode() {
    return _sharedPreferences!.getString('phone_code') ?? '';
  }
}
  
  //   static Future<bool> setCountryId(CountriesData value) async {
  //   return await _sharedPreferences!
  //       .setString('country', value.cacheCountryData());
  // }

  // static CountriesData getCountryId() {
  //   final json = _sharedPreferences!.getString('country');
  //   final model = jsonDecode(json!);
  //   return CountriesData.fromJson(model);
  // }

   
