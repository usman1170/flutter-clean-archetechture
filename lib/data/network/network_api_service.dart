import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/exceptions.dart';
import 'package:mvvm/data/network/basic_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BasicApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic resJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 10));
      resJson = returnResponse(response);
      return resJson;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic resJson;
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      resJson = returnResponse(response);
      return resJson;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadDataException("Bad request");
      case 401:
        throw UnAuthDataException("UnAuthorized");
      case 404:
        throw DataNotFoundException("404 Not found");
      default:
        throw FetchDataException(
            "Server communication Error with status code ${response.statusCode}");
    }
  }
}
