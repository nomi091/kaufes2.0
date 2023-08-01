import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kaufes/repository/auth_repo.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../service/firebase_functions.dart';
import '../../service/hive_service.dart';
import '../../utils/constants/colors.dart';
import '../../utils/routes/routes.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepsitory repo = AuthRepsitory();
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

//profile detils

  //UserDetails Controller and other fields
  final List<String> items = ['Mr', 'Ms', 'None'];
  String countryValue = "";
  String stateValue = "";
  PhoneNumber? phoneNo = PhoneNumber(isoCode: 'DE');
  DateTime selectedDate = DateTime(1999);
  bool showOtpField = false;
  String dropdownValue = '';
  TextEditingController userFullNameController = TextEditingController();
  TextEditingController userNickNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController businessSignInEmail = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController createPassword = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();

  //otp verification
  TextEditingController emailController = TextEditingController();
  TextEditingController emailOtpController = TextEditingController();
  TextEditingController otpConfirmPassword = TextEditingController();
  String emailMessage = "";

//forgot verification
  TextEditingController forgotVerificationEmailController =
      TextEditingController();
  String errorMessageforgotPassword = "";

//get profile data
  getProfileData() async {
    var data = await HiveService.getUserProfile();
    emailController.text = data['email'].toString();
    print('Email From Hive ${emailController.text}');
    notifyListeners();
  }

  nextScreen() {
    if (kDebugMode) {
      print('Drop Down Value $dropdownValue');
      print('User Full Name ${userNickNameController.text}');
      print('Nick Name ${userNickNameController.text}');
      print('Date ${dateController.text}');
      print('Business SignIn  ${businessSignInEmail.text}');
      print('Business Phone  ${phoneNoController.text}');
      print('Business Otp  ${otpController.text}');
      print('Business password Controller  ${createPassword.text}');
      print('Business street Controller  ${streetAddressController.text}');
      print('Business house Number Controller  ${houseNumberController.text}');
      print('Business postCode Controller  ${postCodeController.text}');
      print('country  $countryValue');
      print('State  $stateValue');
    }
    notifyListeners();
  }

  bool get authloading => _authloading;

  setLoading(bool value) {
    _authloading = value;
    notifyListeners();
  }

  openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      dateController.text = picked.toString().substring(0, 10);
    }
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
        print('checking .....');
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
      'fcmToken': deviceToken.toString()
    };
    setLoading(true);
    try {
      final value = await repo.signUpApi(data);
      if (kDebugMode) {
        print('SignUp Responce ==>  ${value.toString()}');
      }
      if (value['error'] == false) {
        await HiveService.saveUserInfo(value["user"]);
        checkVerificationStatus(context);
      } else {
        errorMessageSignUp = value['message'].toString().substring(5);
      }
      setLoading(false);
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
      'fcm_token': deviceToken
    };
    setLoading(true);
    print('Login Data ==>  $data');

    try {
      final value = await repo.loginApi(data);
      if (kDebugMode) {
        print('Login Responce ==>  ${value.toString()}');
      }
      if (value['error'] == false) {
        await HiveService.saveUserInfo(value["user"]);
        checkVerificationStatus(context);
      } else {
        if (value['message'] == 'user:exist_not_active') {
          errorMessageLogin = '';
        } else {
          errorMessageLogin = value['message'].toString().substring(5);
          setLoading(false);
        }
      }
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> sendOtpApiResponce(BuildContext context) async {
    var data = {
      'email': emailController.text,
    };
    setLoading(true);
    try {
      final value = await repo.sendOtp(data);
      if (kDebugMode) {
        print('Otp Responce ==>  ${value.toString()}');
      }
      if (value['error'] == false) {
        emailMessage = value['message'].toString().substring(5);
        notifyListeners();
      } else {
        emailMessage = value['message'].toString().substring(5);
      }
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> emailVerificatonApiResponce(context) async {
    var data = {
      'token': emailOtpController.text,
      'email': emailController.text,
    };
    setLoading(true);
    try {
      final value = await repo.verifyEmailOtp(data);
      if (kDebugMode) {
        print('verify Email Responce ==>  ${value.toString()}');
      }
      if (value['error'] == false) {
        await HiveService.saveUserInfo(value["user"]);
        checkVerificationStatus(context);
      } else {
        if (value['message'] == 'user:exist_not_active') {
          emailMessage = '';
        } else {
          emailMessage = value['message'].toString().substring(5);
        }
      }
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> phonelVerificatonApiResponce(context) async {
    var data = {
      'email': signInEmail.text,
      'otp': signInPassword.text,
    };
    setLoading(true);
    try {
      final value = await repo.loginApi(data);
      if (kDebugMode) {
        print('Login Responce ==>  ${value.toString()}');
      }
      if (value['error'] == false) {
        await HiveService.saveUserInfo(value["user"]);
        checkVerificationStatus(context);
      } else {
        if (value['message'] == 'user:exist_not_active') {
          // errorMessageLogin = '';
        } else if (value['message'] == 'user:not_found') {
          // errorMessageLogin = value['message'].toString().substring(5);
        } else if (value['message'] == 'user:validation_error') {
          // errorMessageLogin = value['message'].toString().substring(5);
        }
      }
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> forgotPasswordApiResponce(context) async {
    var data = {
      'email': forgotVerificationEmailController.text,
    };
    setLoading(true);
    try {
      final value = await repo.sendForgotEmail(data);
      if (kDebugMode) {
        print('Otp Responce ==>  ${value.toString()}');
      }

      if (value['error'] == false) {
        // emailMessage = value['message'].toString().substring(5);
        Navigator.pushNamed(context, ScreenRoutes.resetPasswordScreen);
        notifyListeners();
      } else {
        errorMessageforgotPassword = value['message'].toString().substring(5);
      }
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

//social login verification
  Future signInWithGoogle(context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      errorMessageSocial = "Invalid google account";
    } else {
      var data = {
        "email": googleUser.email,
        "fullName": googleUser.displayName,
        "authCode": googleUser.id,
        "providerId": googleUser.serverAuthCode,
        "provider": "GOOGLE"
      };
      socialAuth(context, data);
      //    print(googleUser.serverAuthCode);
      // print(data);
      //  socialAuth(data, context);
    }
    return null;
  }

  void onPressedFacebookLogin() async {
    // final LoginResult result = await FacebookAuth.instance.login();
    //   if (result.status == LoginStatus.success) {
    //     // you are logged
    //     final AccessToken accessToken = result.accessToken!;

    //     // context
    //     //     .read(userNotifierProvider.notifier)
    //     //     .loginUsingFacebook(accessToken.token);
    //   } else {
    // //    toast(LocaleKeys.something_went_wrong.tr());
    //   }
  }
  Future<dynamic> loginWithInstagram() async {
    const redirectUri = 'YOUR_REDIRECT_URI'; // Replace with your redirect URI
    const clientId = 'YOUR_CLIENT_ID'; // Replace with your Instagram client ID
    const scopes = 'user_profile,user_media'; // Scopes for the Instagram API

    const url =
        'https://api.instagram.com/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&scope=$scopes&response_type=code';

    final result = await FlutterWebAuth.authenticate(
      url: url,
      callbackUrlScheme: redirectUri,
    );

    // Handle the authentication result here (e.g., exchanging the code for an access token).
    // You can use HTTP packages like 'http' or 'dio' to perform API calls.
  }

  void onPressedAppleLogin(context) async {
    final checkAvailability = await SignInWithApple.isAvailable();
    if (checkAvailability) {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        var data = {
          "email": credential.email??"user@gmail.com",
          "fullName": credential.givenName??"user",
          "authCode": credential.identityToken,
          "providerId": credential.userIdentifier,
          "provider": "APPLE"
        };
        // debugPrint(
        //     'User Identifier: ${credential.userIdentifier} Auth Code:  ${credential.authorizationCode},identify token ${credential.identityToken}');
      
        socialAuth(context, data);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> socialAuth(context, data) async {
    setLoading(true);
    try {
      final value = await repo.socialAuthApi(data);
      if (kDebugMode) {
        print('Login Responce ==>  ${value.toString()}');
      }
      if (value['error'] == false) {
        await HiveService.saveUserInfo(value['data']["user"]);
        checkVerificationStatus(context);
      } else {
        if (value['message'] == 'user:exist_not_active') {
          errorMessageLogin = '';
        } else {
          errorMessageLogin = value['message'].toString().substring(5);
          setLoading(false);
        }
      }
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
