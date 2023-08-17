
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFaliure extends Failure {
  ServerFaliure(super.errMessage);

  factory ServerFaliure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure('Connection timeout with API server');
      // TODO: Handle this case.
      case DioExceptionType.sendTimeout:
        return ServerFaliure('Send timeout with server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Receive timeout with server');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      // TODO: Handle this case.
      case DioExceptionType.cancel:
        return ServerFaliure('Request with API cancelled');
      case DioExceptionType.connectionError:
        return ServerFaliure('Connection error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFaliure("No Internet Connection");
        }
        return ServerFaliure("Unexpected Error, Please try again!");
      default:
        return ServerFaliure("There was an error, Please try again!");
    }
  }

  factory ServerFaliure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFaliure('Request not found, Please try again later!');
    } else if (statuscode == 500) {
      return ServerFaliure('Internal server error, Please try again later!');
    } else {
      return ServerFaliure("There was an error, Please try again");
    }
  }
}
