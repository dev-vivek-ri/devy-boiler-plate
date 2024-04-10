// ignore_for_file: depend_on_referenced_packages, avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:devy_boiler_plate/dev/feature/feature.dart';
import 'package:devy_boiler_plate/dev/logging/logger.dart';
import 'package:devy_boiler_plate/service/dio/dio_client.dart';
import 'package:devy_boiler_plate/manager/local_storage/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retry/retry.dart';

enum QueryUrl {
  root,
  auth,
  
}

class APIManager {
  final apitoken = 'f87963468ea6f6930107bcf418a5da92';
  final host = Feature().getAPIURL();
  final deepLinkUrl = Feature().getDeeplinkURL();

  final _contextRoot = '';
  final _mobile = '';
  final _version = '';
  final _api = '/api';

  String? generateMd5(String? input) {
    return md5.convert(utf8.encode(input!)).toString();
  }

  Future<String?> path(QueryUrl query) async {
    switch (query) {
      case QueryUrl.root:
        return "$_api$_version$_mobile/";
      case QueryUrl.auth:
        return "$_api$_version$_mobile/auth";
      
    }
  }

  Future<Map<String?, dynamic>> apiInput(
    QueryUrl query,
    Map<String?, dynamic> parameters,
  ) async {
    final Map<String?, String?> apiInfoDict = {};

    apiInfoDict['apitoken'] = apitoken;
    apiInfoDict['buildversion'] = "1.0.1";

    final Map<String?, dynamic> input = {
      "apiInfo": apiInfoDict,
      "parameters": parameters
    };

    return input;
  }

  Future<Map<String, String>> headers(QueryUrl query) async {
    final String token =
        await SharedPreferencesManager().getValue(Store.accessToken);
    final Map<String, String> header = {};
    header['Content-Type'] = 'application/json;charset=UTF-8';
    header['Accept'] = 'application/json';
    header['Charset'] = 'utf-8';
    if (query != QueryUrl.auth ) {
      header['Authorization'] = 'Bearer $token';
    }
    return header;
  }

  Future<Map<String, String>> headersMultipart(QueryUrl query) async {
    final String token =
        await SharedPreferencesManager().getValue(Store.accessToken);
    final Map<String, String> header = {};

    header['Content-Type'] = 'multipart/form-data';
    header['Accept'] = '*/*';
    header['Charset'] = 'utf-8';
    if (query != QueryUrl.auth ) {
      header['Authorization'] = 'Bearer $token';
    }
    return header;
  }

  Future<Response?> requestPost({
    required QueryUrl query,
    Map<String?, dynamic>? parameters,
    Map<String?, dynamic>? body,
    String? extraURl = "",
  }) async {
    final parametersString = StringBuffer();
    final List<String?>? list = parameters?.keys.toList(growable: false);
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i != 0) {
          parametersString.write('&');
        }
        final String? key = list[i];
        parametersString.write('$key=${parameters![key]}');
      }
    }

    final requestHeaders = await headers(query);

    final fullURL =
        '${await path(query)}$extraURl${parametersString.isNotEmpty ? '?' : ''}$parametersString';

    try {
      return await DioClient()
          .getDioClient()
          .post(fullURL, options: Options(headers: requestHeaders), data: body);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.data == null) {
          return null;
        } else {
          return e.response;
        }
      }
    }

    return null;
  }

  Future<Response?> requestPut({
    required QueryUrl query,
    Map<String?, dynamic>? parameters,
    Map<String?, dynamic>? body,
    String? extraURl = "",
  }) async {
    final parametersString = StringBuffer();
    final List<String?>? list = parameters?.keys.toList(growable: false);
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i != 0) {
          parametersString.write('&');
        }
        final String? key = list[i];
        parametersString.write('$key=${parameters![key]}');
      }
    }

    final requestHeaders = await headers(query);
    final fullURL =
        '${await path(query)}$extraURl${parametersString.isNotEmpty ? '?' : ''}$parametersString';

    try {
      return await DioClient()
          .getDioClient()
          .put(fullURL, options: Options(headers: requestHeaders), data: body);
    } catch (e) {
      if (e is DioException) {
        if (e.response!.data == null) {
          return null;
        } else {
          return e.response;
        }
      }
    }

    return null;
  }

  Future<Response?> requestDelete({
    required QueryUrl query,
    Map<String?, dynamic>? parameters,
    Map<String?, dynamic>? body,
    String? extraURl = "",
  }) async {
    final parametersString = StringBuffer();
    final List<String?>? list = parameters?.keys.toList(growable: false);
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i != 0) {
          parametersString.write('&');
        }
        final String? key = list[i];
        parametersString.write('$key=${parameters![key]}');
      }
    }

    final requestHeaders = await headers(query);

    final fullURL =
        '${await path(query)}$extraURl${parametersString.isNotEmpty ? '?' : ''}$parametersString';

    try {
      return await DioClient().getDioClient().delete(
            fullURL,
            data: body,
            options: Options(headers: requestHeaders),
          );
    } catch (e) {
      if (e is DioException) {
        if (e.response!.data == null) {
          return null;
        } else {
          return e.response;
        }
      }
    }

    return null;
  }

  Future<Response?> requestPatch({
    required QueryUrl query,
    Map<String?, dynamic>? parameters,
    Map<String?, dynamic>? body,
    String? extraURl = "",
  }) async {
    final parametersString = StringBuffer();
    final List<String?>? list = parameters?.keys.toList(growable: false);
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i != 0) {
          parametersString.write('&');
        }
        final String? key = list[i];
        parametersString.write('$key=${parameters![key]}');
      }
    }

    final requestHeaders = await headers(query);

    final fullURL =
        '${await path(query)}$extraURl${parametersString.isNotEmpty ? '?' : ''}$parametersString';
    try {
      return await DioClient().getDioClient().patch(
            fullURL,
            options: Options(headers: requestHeaders),
            data: body,
          );
    } catch (e) {
      if (e is DioException) {
        if (e.response!.data == null) {
          return null;
        } else {
          return e.response;
        }
      }
    }

    return null;
  }

  Future<Response?> requestGet({
    required QueryUrl query,
    BuildContext? context,
    Map<String?, dynamic>? parameters,
    String? extraURl = "",
  }) async {
    final parametersString = StringBuffer();
    final List<String?>? list = parameters?.keys.toList(growable: false);
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (i != 0) {
          parametersString.write('&');
        }
        final String? key = list[i];
        parametersString.write('$key=${parameters![key]}');
      }
    }

    final requestHeaders = await headers(query);

    final fullURL =
        '${await path(query)}$extraURl${parametersString.isNotEmpty ? '?' : ''}$parametersString';

    try {
      return await DioClient().getDioClient().get(
            fullURL,
            options: Options(headers: requestHeaders),
          );
    } catch (e) {
      if (e is DioException) {
        if (e.response!.data == null) {
          return null;
        } else {
          return e.response;
        }
      }

      return null;
    }
  }

  Future<void> uploadFile({
    required QueryUrl query,
    required String file,
    ValueChanged? responds,
    ValueChanged? progress,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    String? extraURl = "",
  }) async {
    final dio = DioClient().getDioClient();

    final fileJson = {
      "image": await MultipartFile.fromFile(
        file,
        contentType: MediaType('image', 'jpeg'),
      ),
    };
    body!.addAll(fileJson);
    final FormData formData = FormData.fromMap(body);

    final fullURL = '${await path(query)}$extraURl';

    final requestHeaders = await headersMultipart(query);

    final response = dio.patch(
      fullURL,
      data: formData,
      options: Options(headers: requestHeaders),
      onSendProgress: (count, total) {
        final int vProgress = ((count / total) * 100).toInt();
        DevLogger().logStackInfo(vProgress);
        progress!([vProgress, parameters]);
      },
      onReceiveProgress: (count, total) {},
    );

    response.then((value) {
      final Map decoded = jsonDecode(value.toString()) as Map;

      responds!([true, parameters, decoded, response, file]);
    });

    response.onError((error, stackTrace) {
      responds!([false, parameters, null, null, file]);
      throw Exception(error);
    });

    response.catchError((value) {
      responds!([false, parameters, null, null, file]);
      throw Exception(value);
    });
  }

  Future<void> uploadFilePut({
    required QueryUrl query,
    required String file,
    dynamic responds,
    dynamic progress,
    Map<String, dynamic>? parameters,
    String? extraURl = "",
  }) async {
    final dio = Dio();

    final String fileName = file.split('/').last;
    final fileJson = {
      "file": await MultipartFile.fromFile(
        file,
        filename: fileName,
      ),
    };
    parameters!.addAll(fileJson);
    final FormData formData = FormData.fromMap(parameters);

    final fullURL = '$host$_contextRoot${await path(query)}$extraURl';

    final requestHeaders = await headersMultipart(query);

    final response = dio.put(
      fullURL,
      data: formData,
      options: Options(headers: requestHeaders),
      onSendProgress: (count, total) {
        final int vProgress = ((count / total) * 100).toInt();

        progress(vProgress, parameters);
      },
      onReceiveProgress: (count, total) {},
    );

    response.then((value) {
      final Map decoded = jsonDecode(value.toString()) as Map;

      responds(true, parameters, decoded, response, file);
    });

    response.onError((error, stackTrace) {
      DevLogger().logStackInfo('url: $fullURL');
      responds(false, parameters, null, null, file);
      throw Exception(error);
    });

    response.catchError((value) {
      responds(false, parameters, null, null, file);
      throw Exception(value);
    });
  }

  void requestPostMultipart({
    required QueryUrl query,
    String? file,
    required Map<String, dynamic> parameters,
    String? extraURl = "",
    dynamic onSend,
    dynamic onReceive,
  }) async {
    final requestHeaders = await headersMultipart(query);

    final String fileName = file!.split('/').last;
    final fileJson = {
      "file": await MultipartFile.fromFile(file,
          contentType: MediaType.parse("image/jpeg"), filename: fileName),
    };

    final fullURL = '$_contextRoot${await path(query)}$extraURl';

    parameters.addAll(fileJson);

    final FormData formData = FormData.fromMap(parameters);

    try {
      await retry(
        () => DioClient().getDioClient().post(fullURL,
            options: Options(headers: requestHeaders),
            data: formData,
            onReceiveProgress: (count, total) => onReceive(count, total),
            onSendProgress: (count, total) => onSend(count, total)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Response<dynamic>> requestGetMultipart({
    required QueryUrl query,
    String? extraURl = "",
  }) async {
    final requestHeaders = await headersMultipart(query);

    final dio = Dio();

    final fullURL =
        '$host$_api$_version$_contextRoot${await path(query)}$extraURl';

    final response = await retry(
      () => dio.get(
        fullURL,
        options: Options(headers: requestHeaders),
      ),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    return response;
  }
}
