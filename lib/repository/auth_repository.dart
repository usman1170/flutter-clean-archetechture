import 'package:mvvm/data/network/basic_api_service.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/resources/constents.dart';

class AuthRepository {
  final BasicApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response = await _apiService.getPostApiResponse(loginURL, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      final response = await _apiService.getPostApiResponse(signUpURL, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
