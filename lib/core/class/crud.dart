import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data,
      {Map<String, String>? headers}) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(url), body: data, headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else if (response.statusCode == 400) {
          return const Left(StatusRequest.failure);
        }

        else if (response.statusCode == 204) {
          return const Left(StatusRequest.noContent);
        }

        else if (response.statusCode == 401) {
          Map responseBody = jsonDecode(response.body);
          bool hasKey = responseBody.containsKey('detail');
          if (hasKey) {
            if (responseBody['detail'] ==
                "Given token not valid for any token type") {
              return const Left(StatusRequest.accessTokenExpired);
            } else if (responseBody['detail'] ==
                "Token is invalid or expired") {
              return const Left(StatusRequest.refreshTokenExpired);
            }
          }
          return const Left(StatusRequest.unauthorized);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String url,
      {Map<String, String>? headers}) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(url), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else if (response.statusCode == 400) {
          return const Left(StatusRequest.failure);
        } else if (response.statusCode == 401) {
          Map responseBody = jsonDecode(response.body);
          bool hasKey = responseBody.containsKey('detail');
          if (hasKey) {
            if (responseBody['detail'] ==
                "Given token not valid for any token type") {
              return const Left(StatusRequest.accessTokenExpired);
            } else if (responseBody['detail'] ==
                "Token is invalid or expired") {
              return const Left(StatusRequest.refreshTokenExpired);
            }
          }
          return const Left(StatusRequest.unauthorized);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(String url, Map data,
      {Map<String, String>? headers}) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.delete(Uri.parse(url), body: data, headers: headers);
        if (response.statusCode == 204) {
          return const Left(StatusRequest.noContent);
        }
        else if(response.statusCode == 200){
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        else if (response.statusCode == 400) {
          return const Left(StatusRequest.failure);
        } else if (response.statusCode == 401) {
          Map responseBody = jsonDecode(response.body);
          bool hasKey = responseBody.containsKey('detail');
          if (hasKey) {
            if (responseBody['detail'] ==
                "Given token not valid for any token type") {
              return const Left(StatusRequest.accessTokenExpired);
            } else if (responseBody['detail'] ==
                "Token is invalid or expired") {
              return const Left(StatusRequest.refreshTokenExpired);
            }
          }
          return const Left(StatusRequest.unauthorized);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
