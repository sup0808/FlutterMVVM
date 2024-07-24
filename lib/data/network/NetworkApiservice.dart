import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm/data/app_exception.dart';
import 'package:flutter_mvvm/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;

class Networkapiservice extends BaseApiService {
  @override
  Future getGetResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return jsonResponse;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 404:
        throw UnauthorizedException(response.statusCode.toString());
      case 500:
      //  throw BadRequestException(response.statusCode.toString());
      default:
        throw FetchDataException(
            "Error occured while comminicating to the server${response.statusCode}");
    }
  }
}
