import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kaufes/repository/auth_repo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../data/responce/api_responce.dart';
import '../../model/auth_model/error_model.dart';
import '../../model/auth_model/success_model.dart';
import '../../service/firebase_functions.dart';
import '../../service/hive_service.dart';
import '../../utils/routes/routes.dart';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {
  final AuthRepsitory repo = AuthRepsitory();

  ApiResponce<SuccessModel> getCompleProfileData = ApiResponce.loading();
  ApiResponce<ErrorModel> getSignUpError = ApiResponce.loading();

  setProfileCompleteData(ApiResponce<SuccessModel> responce) {
    getCompleProfileData = responce;
    debugPrint('set Profile list got');
    notifyListeners();
  }

  setSignUpError(ApiResponce<ErrorModel> responce) {
    if (responce.data?.data != null) {
      List<String>? passwordParts = responce.data?.data?.password?.split(':');
      List<String>? emailParts = responce.data?.data?.email?.split(':');

      if (emailParts != null) {
        emailError = emailParts[0];
      }
      if (passwordParts != null) {
        passwordError = passwordParts[0];
        print(passwordParts);
      }
    }

    debugPrint('set Error list got');
    notifyListeners();
  }

  ///errors
  String emailError = "";
  String passwordError = "";

  bool _authloading = false;
  String errorMessageLogin = "";
  String errorMessageSocial = "";
  String errorMessageSignUp = "";
  String deviceToken = "";
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();

  TextEditingController forgotVerificationEmailController =
      TextEditingController();
  String errorMessageforgotPassword = "";

  bool get authloading => _authloading;

  setLoading(bool value) {
    _authloading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    signInEmail.dispose();
    signInPassword.dispose();
    super.dispose();
  }

  Future<dynamic> getDeviceToken() async {
    FireBaseFunctions.getToken().then((value) {
      deviceToken = value.toString();
    });
  }

  Future<void> checkVerificationStatus(context) async {
    if (context == null) {
      print('Context is null. Returning without performing navigation.');
      return;
    }
    String status = await HiveService.checkVerificationStatus();
    print('Checking Statucs ======== > $status');
    if (status.isEmpty) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        ScreenRoutes.onbroding,
        (route) => false,
      );
    } else {
      if (status == 'Email Unverified') {
        Navigator.pushNamed(
          context,
          ScreenRoutes.emailConfirmationScreen,
        );
      } else if (status == 'Profile Incomplete') {
        Navigator.pushNamedAndRemoveUntil(
            context, ScreenRoutes.detailProgressScreen, (route) => false);
      } else if (status == 'Verified') {
        Navigator.pushNamed(
          context,
          ScreenRoutes.bottomNavBar,
        );
      } else {
        if (kDebugMode) {
          print("something went wrong===========> $status");
        }
      }
    }
  }

  Future<void> signUpApiResponce(context) async {
    var data = {
      'email': signUpEmail.text,
      'password': signUpPassword.text,
      //  'fcmToken': deviceToken.toString()
    };
    setLoading(true);
    try {
      await repo.signUpApi(data).then((value) async {
        if (value.success == true) {
          setProfileCompleteData(ApiResponce.completed(value));
          await HiveService.saveUserInfo(value.data!.user);
          checkVerificationStatus(context);
          setLoading(false);
        } else if (value.code == 422) {
          setSignUpError(ApiResponce.completed(value));
          setLoading(false);
        } else {
          errorMessageLogin = value.message.toString();
          setLoading(false);
        }
      });
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> loginApi(context) async {
    var data = {
      'email': signInEmail.text,
      'password': signInPassword.text,
      // 'fcm_token': deviceToken
    };
    setLoading(true);
    try {
      await repo.loginApi(data).then((value) async {
        print(value.code);
        if (value.success == true) {
          setProfileCompleteData(ApiResponce.completed(value));
          await HiveService.saveUserInfo(value.data!.user);
          checkVerificationStatus(context);
          setLoading(false);
        } else if (value.code == 422) {
          setSignUpError(ApiResponce.completed(value));
          setLoading(false);
        } else {
          errorMessageLogin = value.message.toString();
          setLoading(false);
        }
      });
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  void onPressedAppleLogin(context) async {
    final checkAvailability = await SignInWithApple.isAvailable();
    if (checkAvailability) {
      try {
        final nonce = generateNonce();
        final credential = await SignInWithApple.getAppleIDCredential(
          nonce: nonce,
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        var data = {
          "oAuthCode": credential.identityToken,
          "nonce": nonce,
        };
        debugPrint(
            'nonce: $nonce,\nAuth Code:  ${credential.authorizationCode},\n identity Code:  ${credential.identityToken} ');

        await repo.socialAuthApi(data, "apple").then((value) async {
          print(value.code);
          if (value.success == true) {
            setProfileCompleteData(ApiResponce.completed(value));
            await HiveService.saveUserInfo(value.data!.user);
            checkVerificationStatus(context);
            setLoading(false);
          } else if (value.code == 422) {
            setSignUpError(ApiResponce.completed(value));
            setLoading(false);
          } else {
            errorMessageLogin = value.message.toString();
            setLoading(false);
          }
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void onPressedGoogleLogin(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
        clientId:
            "718932924527-qpua5c5mderf768eqt0c419hpuqg1k93.apps.googleusercontent.com",
        serverClientId:
            "718932924527-4em9535lb3p3nijpdvr41g6aubpqlfmr.apps.googleusercontent.com");

    try {
      var responce = await googleSignIn.signIn();
      var data = {"oAuthCode": "${responce!.serverAuthCode}", "fcmToken": ""};
      debugPrint(data.toString());
      await repo.socialAuthApi(data, "google").then((value) async {
        if (value.success == true) {
          setProfileCompleteData(ApiResponce.completed(value));
          await HiveService.saveUserInfo(value.data!.user);
          checkVerificationStatus(context);
          setLoading(false);
        } else if (value.code == 422) {
          setSignUpError(ApiResponce.completed(value));
          setLoading(false);
        } else {
          errorMessageLogin = value.message.toString();
          setLoading(false);
        }
      });
    } catch (error) {
      print("Error Google ========>$error");
    }
  }

  void onPressedFacebookLogin(context) async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: (['email', 'public_profile']));
      print('Object is here ${result.accessToken}');

      final token = result.accessToken!.token;

      print(
          'Facebook token userID : ${result.accessToken!.grantedPermissions}');

      final graphResponse = await http.get(Uri.parse(
          'https://graph.facebook.com/'
          'v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));

      final profile = jsonDecode(graphResponse.body);
      print(profile);
    } catch (e) {
      print("error occurred");
      print(e.toString());
    }
  }

  Future<void> forgotPasswordApi(context) async {
    var data = {
      'email': forgotVerificationEmailController.text,
    };
    setLoading(true);
    try {
      await repo.sendForgotPassword(data).then((value) async {
        setLoading(false);
        if (value['success'] == true) {
          errorMessageforgotPassword = value['message'].toString();
          
        } else {
          errorMessageforgotPassword = value['data']['email'].toString();
        }
      });
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
