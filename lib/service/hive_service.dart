import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../model/auth_model/success_model.dart';
import 'hive_utils.dart';

class HiveService {
  HiveService._providerConstructor();
  static final HiveService instance = HiveService._providerConstructor();

  Future<Box> get box async {
    return await Hive.openBox(userLoginDetails);
  }

  static Future<void> saveUserInfo(User user) async {
    Box box = await instance.box;
    String userJson = jsonEncode(user.toJson()); // Convert user to JSON string
    box.put(userDetails, userJson);
    if (kDebugMode) {
      print("Saved: $userJson");
    }
  }

  static Future saveUserAccessToken(var token) async {
    Box box = await instance.box;
    box.put(accessToken, token);
    if (kDebugMode) {
      print("accessToken ${await box.get(accessToken)}");
    }
  }

  static Future saveUserRefreshToken(var refresh) async {
    Box box = await instance.box;
    box.put(refreshToken, refresh);
    if (kDebugMode) {
      print("refreshToken ${await box.get(refreshToken)}");
    }
  }

  static Future getUserAccessToken() async {
    Box box = await instance.box;
    return await box.get(accessToken);
  }

  static Future getUserRefreshToken() async {
    Box box = await instance.box;
    return await box.get(refreshToken);
  }

  static Future getUserProfile() async {
    Box box = await instance.box;
    var userprofile = await box.get(userDetails);
    Map<String, dynamic> userMap = jsonDecode(userprofile);
    User user = User.fromJson(userMap);
    return user;
  }

//verification
  static Future<String> checkVerificationStatus() async {
    Box box = await instance.box;
    var userJson = box.get(userDetails);
    print(userJson);
    if (userJson == null) return '';
    Map<String, dynamic> userMap = jsonDecode(userJson);
    User user = User.fromJson(userMap);
    print(user.email);
    if (user.isEmailVerified == false) {
      return 'Email Unverified';
    } else if (user.isProfileComplete == false) {
      return 'Profile Incomplete';
    } else {
      return 'Verified';
    }
  }

//Sign Out
  static Future signOut() async {
    Box box = await instance.box;
    box.delete(userDetails);
    if (kDebugMode) {
      print("check ${await box.get(userDetails)}");
    }
  }
  // static Future saveResentSearches(var data) async {
  //   Box box = await instance.box;
  //   List list=[];
  //   if(await box.get(RECENT_SEARCHES)!=null){
  //     list = await box.get(RECENT_SEARCHES);
  //     list = list.toSet().toList();
  //     list.add(data);
  //   }else {
  //     list.add(data);
  //   }
  //   box.put(RECENT_SEARCHES,list);
  //   print("save saveResentSearches ${ await box.get(RECENT_SEARCHES)}");
  // }
  // static Future getResentSearches() async {
  //   Box box = await instance.box;
  //   return await box.get(RECENT_SEARCHES);
  // }
}
