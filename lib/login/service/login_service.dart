import 'dart:io';
import 'package:dio/src/dio.dart';
import '../model/login_response_model.dart';

import '../model/login_request_model.dart';

import 'ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response =
        await dio.post(loginPath, data: model).catchError(_handleDioError);
    // print(HttpStatus);
    //if (response.statusCode == HttpStatus.)

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      return null;
    }
    // if (response.statusCode == HttpStatus.badRequest) {
    //   return null;
    // }
  }

  void _handleDioError(dynamic error) {
    print(error);
  }
}
