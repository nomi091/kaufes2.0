abstract class BaseApiService {
  Future<dynamic> getApiResponse(
      String url, dynamic queryParameters,bool tokentrue, String? token, );
  Future<dynamic> postApiResponse(
      String url, dynamic data, bool tokentrue, String? token);
      Future<dynamic> putApiResponse(
      String url, dynamic data, bool tokentrue, String? token);
      Future<dynamic> deleteApiResponse(
      String url, String? token);
}