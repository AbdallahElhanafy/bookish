import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  var apikey = '&key=AIzaSyAymbZgmUEwwRN-EPtIzxrvuZsB8o5Wz4U';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint$apikey');
    return response.data;
  }
}
