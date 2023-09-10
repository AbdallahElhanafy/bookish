import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  var apikey = '&key=AIzaSyAymbZgmUEwwRN-EPtIzxrvuZsB8o5Wz4U';
  final imgUrl = '?fields=id,volumeInfo(title,imageLinks)';
  final volume = 'https://www.googleapis.com/books/v1/volumes/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint&download=epub');
    return response.data;
  }

  Future<Map<String, dynamic>> getBookImage({required String id}) async {
    var response = await _dio.get('$volume$id$imgUrl');
    return response.data;
  }
}
