import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/repository/auth_repo.dart';
import '../../data/responce/api_responce.dart';
import '../../model/auth_model/error_model.dart';
import '../../model/auth_model/success_model.dart';
import '../../service/hive_service.dart';
import '../../utils/constants/colors.dart';
import '../../utils/routes/routes.dart';

class SignUpProfileViewModel extends ChangeNotifier {
  final AuthRepsitory repo = AuthRepsitory();

  ApiResponce<SuccessModel> getCompleProfileData = ApiResponce.loading();
  ApiResponce<ErrorModel> getProfileValidation = ApiResponce.loading();

  setProfileCompleteData(ApiResponce<SuccessModel> responce) {
    getCompleProfileData = responce;
    debugPrint('set Profile list got');
    notifyListeners();
  }

  suignUpProfileValidation(ApiResponce<ErrorModel> responce) {
    if (responce.data?.data != null) {
      List<String>? fullNameParts = responce.data?.data?.fullName?.split(':');
      List<String>? userNameParts = responce.data?.data?.username?.split(':');
      List<String>? dobParts = responce.data?.data?.dob?.split(':');
      List<String>? streetAddressParts =
          responce.data?.data?.streetAddress?.split(':');
      List<String>? houseNumberParts =
          responce.data?.data?.houseNumber?.split(':');
      List<String>? postCodeParts = responce.data?.data?.postCode?.split(':');
      List<String>? cityParts = responce.data?.data?.city?.split(':');
      List<String>? countryParts = responce.data?.data?.country?.split(':');

      if (fullNameParts != null) {
        fullNameError = fullNameParts[0];
      }
      if (userNameParts != null) {
        userNameError = userNameParts[0];
      }
      if (dobParts != null) {
        dobError = dobParts[0];
      }
      if (streetAddressParts != null) {
        streetAddressError = streetAddressParts[0];
      }
      if (houseNumberParts != null) {
        houseNumberError = houseNumberParts[0];
      }
      if (postCodeParts != null) {
        postCodeError = postCodeParts[0];
      }
      if (cityParts != null) {
        cityError = cityParts[0];
      }
      if (countryParts != null) {
        cityError = countryParts[0];
      }
    }

    debugPrint('set Error list got');
    getProfileValidation = responce;
    notifyListeners();
  }

  ///errors
  String fullNameError = "";
  String userNameError = "";
  String dobError = "";
  String streetAddressError = "";
  String houseNumberError = "";
  String postCodeError = "";
  String cityError = "";
  String countryError = "";
  bool _authloading = false;
  bool _validate = false;

//profile detils

  //UserDetails Controller and other fields
  final List<String> items = ['Mr', 'Ms', 'None'];
  String countryValue = "";
  String stateValue = "";
  DateTime selectedDate = DateTime(1999);
  String dropdownValue = 'Mr';
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
  String phoneNumber = "";
  //otp verification
  TextEditingController emailController = TextEditingController();
  TextEditingController emailOtpController = TextEditingController();
  TextEditingController otpConfirmPassword = TextEditingController();
  String emailMessage = "";
  String code = "49";

//forgot verification
  TextEditingController forgotVerificationEmailController =
      TextEditingController();
  String errorMessageforgotPassword = "";

//get profile data
  getProfileData() async {
    await HiveService.getUserProfile().then((value) {
      if (value is User) {
        emailController.text = value.email
            .toString(); // Assuming your User class has an email property
        businessSignInEmail.text = value.email.toString();
        print('Email From Hive ${emailController.text}');
      }
    });
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
  bool get validate => _validate;

  setLoading(bool value) {
    _authloading = value;
    notifyListeners();
  }

  setValidate(bool value) {
    _validate = value;
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

  Future<void> completeProfileApi1(
    context,
  ) async {
    var data = {
      "salutation": 1,
      "fullName": userFullNameController.text,
      "username": userNickNameController.text,
      "dob": dateController.text
    };
    try {
      await repo.completeProfileApi(data, "1").then((value) async {
        if (value.success == true) {
          setProfileCompleteData(ApiResponce.completed(value));
          setValidate(true);
          await HiveService.saveUserInfo(value.data!.user!);
        } else {
          suignUpProfileValidation(ApiResponce.completed(value));
          setValidate(false);
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> completeProfileApi2(
    context,
  ) async {
    var data = {
      "email": businessSignInEmail.text,
      "password": createPassword.text,
      "phoneNumber": '+${code + phoneNoController.text}'
      //  'fcmToken': deviceToken.toString()
    };
    try {
      await repo.completeProfileApi(data, "2").then((value) async {
        // print(value.toString());
        if (value.success == true) {
          setProfileCompleteData(ApiResponce.completed(value));
          setValidate(true);
          await HiveService.saveUserInfo(value.data!.user!);
        } else {
          suignUpProfileValidation(ApiResponce.completed(value));
          setValidate(false);
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> completeProfileApi3(
    context,
  ) async {
    var data = {
      "streetAddress": streetAddressController.text,
      "houseNumber": houseNumberController.text,
      "postCode": postCodeController.text,
      "city": countryValue,
      "country": stateValue
    };
    setLoading(true);
    try {
      await repo.completeProfileApi(data, "3").then((value) async {
        if (value.success == true) {
          setProfileCompleteData(ApiResponce.completed(value));
          await HiveService.saveUserInfo(value.data!.user!);
          Navigator.pushNamed(context, ScreenRoutes.successScreen);
        } else {
          suignUpProfileValidation(ApiResponce.completed(value));
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
}
