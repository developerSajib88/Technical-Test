import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:technical_test/data/custom_log.dart';
import 'package:http/http.dart' as http;


class ApiMethod{

  /// This class I am create for
  /// Separate http method as like get, post, update, delete and fetch
  /// from api service. And for separate part by part for re-use in api service


  // Get Method
  static Future<Map<String, dynamic>?> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url),
          headers: {"Content-Type": "application/json"}
      ).timeout(const Duration(seconds: 60));

      responseReport(method: "GET", response: response.body.toString());

      if (response.statusCode == 200) {

        return jsonDecode(response.body);

      } else if (response.statusCode == 401) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 401 🐞🐞🐞");
        CustomLog.customPrinter("Hit Here!**|token-expire|******* $url");
        return null;

      } else if (response.statusCode == 204) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 204 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 406) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 406 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 400) {
        CustomLog.customPrinter(
            "🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;
      } else if (response.statusCode != 200) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;
      } else {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

        CustomLog.customPrinter("unknown error hit in status code ${jsonDecode(response.body)}");
        return null;
      }
    } on SocketException {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;
    } on TimeoutException {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

      CustomLog.customPrinter("Time out exception $url");
      return null;
    } on http.ClientException catch (err, stackTrace) {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("client exception hit");
      CustomLog.customPrinter(err.toString());
      CustomLog.customPrinter(stackTrace.toString());
      return null;
    } catch (e, err) {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("❌❌❌  unlisted error received");
      CustomLog.customPrinter("❌❌❌ $e");
      CustomLog.customPrinter("❌❌❌ $err");
      return null;
    }
  }


  // Post Method
  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic>? body,) async {
    prevReport(method: "POST", url: url, body: body);

    try {
      final response = await http
          .post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 60));
      responseReport(method: "POST", response: response.body.toString());

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 406) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 406 🐞🐞🐞");
        return null;

      } else if (response.statusCode == 500) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        return null;

      } else if (response.statusCode == 401) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        CustomLog.customPrinter("Hit Here!**|token-expire|******* $url");
        return null;

      } else {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        CustomLog.customPrinter("unknown error hit in status code ${jsonDecode(response.body)}");
        return null;

      }
    } on SocketException {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;

    } on TimeoutException {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("Time out exception $url");
      return null;

    } on http.ClientException catch (err, stackTrace) {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("client exception hit");
      CustomLog.customPrinter(err.toString());
      CustomLog.customPrinter(stackTrace.toString());
      return null;
    } catch (e, err) {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("❌❌❌  unlisted error received");
      CustomLog.customPrinter("❌❌❌ $e");
      CustomLog.customPrinter("❌❌❌ $err");
      return null;
    }
  }


  //Put Method
  Future<Map<String, dynamic>?> put(String url, Map<String, dynamic>? body) async {
    prevReport(method: "PUT", url: url, body: body);

    try {
      final response = await http.put(Uri.parse(url),
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 60));
      responseReport(method: "PUT", response: response.body.toString());

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 406) {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        return null;
      } else if (response.statusCode == 400) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 400 || ${response.statusCode} 🐞🐞🐞");
        return null;

      } else if (response.statusCode == 401) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        CustomLog.customPrinter("Hit Here!**|token-expire|* $url");
        CustomLog.customPrinter("Invalid Token");
        return null;

      } else {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        CustomLog.customPrinter("unknown error hit in status code ${jsonDecode(response.body)}");
        return null;

      }
    } on SocketException {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;

    } on TimeoutException {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("Time out exception $url");
      return null;

    } on http.ClientException catch (err, stackTrace) {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("client exception hit");
      CustomLog.customPrinter(err.toString());
      CustomLog.customPrinter(stackTrace.toString());
      return null;

    } catch (e) {
      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("unlisted catch error received");
      CustomLog.customPrinter(e.toString());
      return null;
    }
  }


  // Delete Method
  Future<Map<String, dynamic>?> delete(String url) async {
    prevReport(method: "DELETE", url: url);

    try {
      final response = await http
          .delete(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      ).timeout(const Duration(seconds: 60));

      responseReport(
        method: "DELETE",
        response: response.body,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        CustomLog.customPrinter("Hit Here!**|token-expire|*******$url");
        return null;

      } else if (response.statusCode == 406) {

        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
        return null;

      }else {
        CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");

        CustomLog.customPrinter("unknown error hitted in status code ${jsonDecode(response.body)}");
        return null;
      }
    } on SocketException {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert on Socket Exception 🐞🐞🐞");
      return null;

    } on TimeoutException {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("Time out exception $url");

      return null;
    } on http.ClientException catch (err, stackTrace) {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("client exception hit");
      CustomLog.customPrinter(err.toString());
      CustomLog.customPrinter(stackTrace.toString());
      return null;

    } catch (e, err) {

      CustomLog.customPrinter("🐞🐞🐞 Error Alert 🐞🐞🐞");
      CustomLog.customPrinter("❌❌❌  unlisted error received");
      CustomLog.customPrinter("❌❌❌ $e");
      CustomLog.customPrinter("❌❌❌ $err");
      return null;

    }
  }



  /// This function for checking after api calling api url, body, and api method
  prevReport(
      {required String method,
        required String url,
        Map<String, dynamic>? body}) {
    print("|-------");
    print("|🚀  📡  🚀|");

    CustomLog.customPrinterYellow("[METHOD] : $method");
    CustomLog.customPrinterYellow("[url] : $url");
    CustomLog.customPrinterWhite("[body] : $body");
    print("|🚀|");
    print("|-------");
  }


  /// This function for checking
  /// after api calling api url, body, and Api response from server
  static responseReport({
    required String method,
    required String response,
  }) {
    print("|-------");
    print("|🌱|");
    CustomLog.customPrinterGreen("[METHOD] : $method");
    CustomLog.customPrinterGreen("[url] : $response");
    print("|🌱|");
    print("|-------");
  }



}
