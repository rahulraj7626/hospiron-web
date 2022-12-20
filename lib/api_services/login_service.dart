import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospiron_reception/common_widgets/toast.dart';
import 'package:hospiron_reception/constants/api_constants.dart';
import 'package:hospiron_reception/view/home_screens/home_screen.dart';
import 'package:http/http.dart' as http;

Future loginService(BuildContext context, email, password) async {
  Map? mapResponse;

  var data = {'email': email, 'password': password};
  http.Response response;
  response = await http.post(
    Uri.parse(LoginConstants.loginApi),
    body: (data),
  );
  if (response.statusCode == 200) {
    mapResponse = jsonDecode(response.body);

    ShowToast.toastShow(context, 'OTP generated successfully', Colors.green);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } else {
    ShowToast.toastShow(context, response.body, Colors.red);
  }
}
