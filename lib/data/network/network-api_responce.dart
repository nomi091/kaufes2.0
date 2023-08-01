import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kaufes/data/network/base_api_service.dart';

import '../../service/hive_service.dart';
import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  Dio dio = Dio();

//get Api Responce
  @override
  Future getApiResponse(
    String url,
    dynamic queryParameters,
    bool tokentrue,
    String? token,
  ) async {
    if (kDebugMode) {
      print('Api Url ====>$url');
    }
    try {
      Map<String, String> header;
      if (tokentrue) {
        header = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'accessToken': "${await HiveService.getUserAccessToken()}",
          'refreshToken': "${await HiveService.getUserRefreshToken()}",
          'lang': 'en'
        };
      } else {
        header = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': 'en'
        };
      }
      final response = await dio
          .get(url,
              queryParameters: queryParameters,
              options: Options(headers: header))
          .timeout(const Duration(seconds: 20));

      if (kDebugMode) {
        print('Responce ====> ${response.data}');
      }
      return returnResponse(response);
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw UnauthorizedException(e.message);
      }
    }
  }

  //Post Api Responce
  @override
  Future postApiResponse(
      String url, data, bool tokentrue, String? token) async {
    try {
      if (kDebugMode) {
        print('Api Url ====>$url');
        print('Api data ====>$data');
      }
      final headers = {'Content-Type': 'application/json'};
      if (tokentrue) {
        headers["Authorization"] = "Bearer $token";
      }

      final response = await dio
          .post(url, data: data, options: Options(headers: headers))
          .timeout(const Duration(seconds: 20));
      if (kDebugMode) {}

      return returnResponse(response);
    } on DioException catch (e) {
      return jsonDecode(e.response.toString());
    }
  }

  //delete api responce
  @override
  Future deleteApiResponse(String url, String? token) {
    throw UnimplementedError();
  }

  @override
  Future putApiResponse(String url, data, bool tokentrue, String? token) {
    throw UnimplementedError();
  }

  dynamic returnResponse(Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.toString());
    } else if (response.statusCode == 201) {
      return jsonDecode(response.toString());
    } else {
      throw FetchDataException('Error occurred');
    }
  }
}
