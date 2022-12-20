import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospiron_reception/common_widgets/toast.dart';
import 'package:hospiron_reception/constants/api_constants.dart';
import 'package:hospiron_reception/model/op_patient_model.dart';
import 'package:http/http.dart' as http;

Future<PatientModel?> patientListig(BuildContext context) async {
  var token = "Bearer 159|5sUtS4XFnJ8XWYcou4VOcHBZb0qi5z5SItGSlBCQ";
  try {
    http.Response response;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    String _uri = LoginConstants.patientList;
    response = await http.get(Uri.parse(_uri),
        headers: {'Content-type': 'application/json', "Authorization": token});

    if (response.statusCode == 200) {
      var patientList = json.decode(response.body);
      PatientModel patientModelList = PatientModel.fromJson(patientList);
      return patientModelList;
    } else {
      ShowToast.toastShow(context, response.body.toString(), Colors.red);
      print(response.body.toString());
      return null;
    }
  } catch (e) {
    ShowToast.toastShow(context, 'Something went wrong', Colors.red);
    print('Failed');
    return null;
  }
}
