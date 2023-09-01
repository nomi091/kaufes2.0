import 'package:flutter/foundation.dart';

import '../data/network/network-api_responce.dart';
import '../model/auth_model/error_model.dart';
import '../model/auth_model/success_model.dart';
import '../utils/constants/app_url.dart';

class AuthRepsitory {
  final NetworkApiService _apiService = NetworkApiService();
  Future<dynamic> loginApi(
    dynamic data,
  ) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.signInEndPointEndPoint,
        data,
        false,
      );
      if (kDebugMode) {
        print(response);
      }
      if (response['code'] == 422) {
        ErrorModel errorModel = ErrorModel.fromJson(response);
        return errorModel;
      } else {
        SuccessModel successModel = SuccessModel.fromJson(response);
        return successModel;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(
    dynamic data,
  ) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.signUpEndPoint,
        data,
        false,
      );
      if (kDebugMode) {
        print('Responce from server========> $response');
      }
      if (response['code'] == 422) {
        ErrorModel errorModel = ErrorModel.fromJson(response);
        return errorModel;
      } else {
        SuccessModel successModel = SuccessModel.fromJson(response);
        return successModel;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> completeProfileApi(dynamic data, var page) async {
    try {
      dynamic response = await _apiService.putApiResponse(
        '${AppUrl.completeProfileEndPointEndPoint}/$page',
        data,
        true,
      );
      if (kDebugMode) {
        print('Responce from server========> $response');
        print('Responce from server========> $response');
      }
      if (response['code'] == 422) {
        ErrorModel errorModel = ErrorModel.fromJson(response);
        return errorModel;
      } else {
        SuccessModel successModel = SuccessModel.fromJson(response);
        return successModel;
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> sendOtp(
  //   dynamic data,
  // ) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse(
  //       AppUrl.sendOtpOnEmailEndPoint,
  //       data,
  //       false,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // Future<dynamic> verifyEmailOtp(
  //   dynamic data,
  // ) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse(
  //       AppUrl.verifyEmailEndPoint,
  //       data,
  //       false,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<dynamic> sendForgotPassword(
    dynamic data,
  ) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.verifyAccountEmailApi,
        data,
        false,
      );
      // print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> socialAuthApi(dynamic data, String provider) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        '${AppUrl.socialLoginEndPoint}/$provider',
        data,
        false,
      );
      if (response['code'] == 422) {
        ErrorModel errorModel = ErrorModel.fromJson(response);
        return errorModel;
      } else {
        SuccessModel successModel = SuccessModel.fromJson(response);
        return successModel;
      }
    } catch (e) {
      rethrow;
    }
  }
}
