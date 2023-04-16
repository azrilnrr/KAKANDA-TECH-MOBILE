import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kakanda_tech/network/api.dart';
import 'package:kakanda_tech/pages/homeScreen.dart';
import 'package:kakanda_tech/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  var email, password;

  Future<void> Checklogin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var _login = localStorage.getBool('isLogin');

    if (_login == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }

  void initState() {
    super.initState();
    Checklogin();
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.centerRight),
        ),
        child: Column(
          children: [
            Container(
              height: 210,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Login
                  Text('LOGIN', style: login),
                  SizedBox(height: 7.5),

                  /// WELCOME
                  Text('Welcome to Kakanda-Tech', style: titleLogin),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 60),

                      /// Text Fields
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 20,
                                  spreadRadius: 10,
                                  offset: const Offset(0, 10)),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /// EMAIL
                            TextField(
                              controller: _email,
                              style: TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  // errorText: _errorEmail,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  isCollapsed: false,
                                  hintStyle: hintText),
                            ),
                            Divider(color: Colors.black54, height: 1),

                            /// PASSWORD
                            TextField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  // errorText: _errorPass,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  isCollapsed: false,
                                  hintStyle: hintText),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),

                      /// LOGIN BUTTON
                      MaterialButton(
                        onPressed: () {
                          setState(() {});
                          // Navigator.pushNamed(context, '/dashboard');
                          _login();
                        },
                        height: 45,
                        minWidth: 240,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue.shade700,
                        shape: const StadiumBorder(),
                      ),
                      const SizedBox(height: 25),

                      /// Rich Text & Toast
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 30, left: 30),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Kakanda-Tech ',
                            style: label,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // void _login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   email = _email.text.toString();
  //   password = _password.text.toString();

  //   var data = {'email': email, 'password': password};

  //   var res = await Network().auth(data, '/login');
  //   var body = json.decode(res.body);
  //   if (body['meta']['code'] == 200) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString(
  //         'token', json.encode(body['data']['access_token']));
  //     localStorage.setBool('isLogin', true);
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomeScreen(),
  //         ));
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //       "Anda berhasil login",
  //       style: snackbarHint,
  //     )));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //       "Email dan Password tidak boleh kosong\natau Anda Belum Registrasi",
  //       style: snackbarHint,
  //     )));
  //     print(body['meta']['code']);
  //     print("$email $password");
  //   }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    email = _email.text.toString();
    password = _password.text.toString();
    var apiURL = '/login';

    var data = {'email': email, 'password': password};

    var res = await Network().auth(data, apiURL);
    var body = json.decode(res.body);
    if (body['meta']['code'] == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      await localStorage.setString(
          'token', jsonEncode(body['data']['access_token']));
      print(json.encode(body['data']['access_token']));
      localStorage.setBool('isLogin', true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Anda berhasil login",
        style: snackbarHint,
      )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Email dan Password tidak boleh kosong\natau Anda Belum Registrasi",
        style: snackbarHint,
      )));
      print(body['meta']['code']);
      print("$email $password");
    }
    setState(() {
      _isLoading = false;
    });
  }
}
