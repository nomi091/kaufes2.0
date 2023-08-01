import '../data/network/network-api_responce.dart';
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
        null,
      );

      return response;
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
        null,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> sendOtp(
    dynamic data,
  ) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.sendOtpOnEmailEndPoint,
        data,
        false,
        null,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> sendForgotEmail(
    dynamic data,
  ) async {
    
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.verifyAccountEmailApi,
        data,
        false,
        null,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> verifyEmailOtp(
    dynamic data,
  ) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.verifyEmailEndPoint,
        data,
        false,
        null,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
   Future<dynamic> socialAuthApi(
    dynamic data,
  ) async {
    try {
      dynamic response = await _apiService.postApiResponse(
        AppUrl.socialLoginEndPoint,
        data,
        false,
        null,
      );
     print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
