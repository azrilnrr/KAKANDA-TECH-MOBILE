import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/data/trasaction.dart';

class Network {
  final String _url = 'https://ws-tif.com/kel6/api';

  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
  }

  auth(data, apiURL) async {
    var apiURL = '/login';
    var full = _url + apiURL;
    var fullUrl = Uri.parse(full);
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1, max);
    var apiURL = '/logout';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + subToken
    };
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    return await http.post(url, headers: headers);
  }

  Future<List<Transaction>> getDataTransactionWeb() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1, max);
    var apiURL = '/transaction?id_product=2';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + subToken
    };
    try {
      // final response = await http.get(url, headers: headers);
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(subToken);
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        print(parsed);
        return parsed
            .map<Transaction>((json) => Transaction.fromJson(json))
            .toList();
      } else {
        // print('subToken');
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<List<Transaction>> getDataTransactionMobile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1, max);
    var apiURL = '/transaction?id_product=3';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + subToken
    };
    try {
      // final response = await http.get(url, headers: headers);
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(subToken);
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        print(parsed);
        return parsed
            .map<Transaction>((json) => Transaction.fromJson(json))
            .toList();
      } else {
        // print('subToken');
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<List<Transaction>> getDataTransactionSeo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1, max);
    var apiURL = '/transaction?id_product=1';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + subToken
    };
    try {
      // final response = await http.get(url, headers: headers);
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(subToken);
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        print(parsed);
        return parsed
            .map<Transaction>((json) => Transaction.fromJson(json))
            .toList();
      } else {
        // print('subToken');
        return [];
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }

  // transaction(data, apiURL) async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token1 = localStorage.getString('token')!;
  //   int long = token1.length;
  //   int max = long - 1;
  //   var subToken = token1.substring(1, max);
  //   var full = _url + apiURL;
  //   var url = Uri.parse(full);
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'accept': 'application/json',
  //     'Authorization': 'Bearer $subToken',
  //   };
  //   return await http.post(
  //     url,
  //     body: jsonDecode(data),
  //     headers: headers,
  //   );
  // }

  Future login({
    String? email,
    String? password,
  }) async {
    var url = '$_url/login';
    var headers = _setHeaders();
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var _token = data['access_token'];
      localStorage.setString(token, _token);
    } else {
      throw Exception('Gagal Login');
    }
  }

  getData(apiURL) async {
    var full = _url + apiURL;
    var fullUri = Uri.parse(full);
    await _getToken();
    return await http.get(fullUri, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
