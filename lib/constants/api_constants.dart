class BaseConstants {
  static String baseUrl = 'http://varastoo.auxacare.com/';
  static String apiUrl = baseUrl + 'public/api/Reception/';
}

class LoginConstants {
  static String loginApi = BaseConstants.apiUrl + 'login';
  static String patientList = BaseConstants.apiUrl + 'patients';
}
