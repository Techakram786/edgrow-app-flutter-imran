import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin SecureStorage {
  static const FlutterSecureStorage _flutterSecureStorage =
  FlutterSecureStorage();
  static const String appUserId= 'app_user_id';
  static const String accessToken= 'access_token';
  static const String cuurentPosition= 'is_current_position_updated';
  static const String contactInfo= 'contact_info';
  static const String eduDtl= 'education_details';
  static const String keySkill= 'key_skills';
  static const String jobPref= 'job_preferences';
  static const String preferedLoc= 'preferred_location';
  static const String expSalary= 'expected_salary';
  static const String resume= 'resume';
  static const String deviceToken= '';

  static Future<dynamic> write(
      {required String key, required String value}) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
    } catch (e) {
      debugger(message: e.toString());
    }
  }

  static Future<dynamic> delete({required String key}) async {
    try {
      await _flutterSecureStorage.delete(key: key);
    } catch (e) {
      debugger(message: e.toString());
    }
  }
  static Future<void> deleteAll() async {
    try {
      // Get all keys
      Map<String, String>? allValues = await _flutterSecureStorage.readAll();

      // Delete each key
      if (allValues.isNotEmpty) {
        for (String key in allValues.keys) {
          await _flutterSecureStorage.delete(key: key);
        }
      }
    } catch (e) {
      debugger(message: e.toString());
    }
  }
  static Future<String?> get({required String key}) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (e) {
      debugger(message: e.toString());
    }
    return null;
  }
}