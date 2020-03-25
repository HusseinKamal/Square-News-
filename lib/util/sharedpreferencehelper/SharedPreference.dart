import 'package:shared_preferences/shared_preferences.dart';
class SharedPreference{
  static const String SHARED_PREFERENCE_LANGUAGE_KEY = "language";
  static const String SHARED_PREFERENCE_USER_ID = "userID";
  static const String SHARED_PREFERENCE_ACCESS_TOKEN = "accessToken";
  static const String SHARED_PREFERENCE_ENCRYPTED_ACCESS_TOKEN = "encryptAccessToken";
  static const String SHARED_PREFERENCE_USERNAME = "username";
  static const String SHARED_PREFERENCE_TENANCY_NAME = "tenancyName";

  static Future<bool> getSharedBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
  static void setSharedBool(String key,bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<String> getSharedString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)?? '';
  }

  static void setSharedString(String key,String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getSharedDouble(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? 0;
  }

  static void setSharedDouble(String key,double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }
  static Future<String> getSharedInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? 0;
  }

  static void setSharedInt(String key,int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

/*static Future<Data> getSharedObject(String key) async {

     SharedPreferences shared_User = await SharedPreferences.getInstance();
     Map userMap = jsonDecode(shared_User.getString('user'));
     var user = Data.fromJson(userMap);
     return user;
   }

   static void setSharedObject(String key,String value) async {
     SharedPreferences shared_User = await SharedPreferences.getInstance();
     Map decode_options = jsonDecode(value);
     String user = jsonEncode(Data.fromJson(decode_options));
     shared_User.setString('user', user);
   }*/

}