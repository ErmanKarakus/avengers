import 'dart:developer';

class ApiConst {
  static const Map<String, String> contentType = {"Content-Type": "application/json; charset=utf-8"};

  static String definedErrorMessage(String title, String message){
    return "$title: $message";
  }

  static String errorMessage(int code){
    return "Invalid response received from server, Status Code: $code";
  }

  static String catchMessage({required e, required String name}){
    log(e.toString(), name: name, time: DateTime.now());
    return "Something went wrong :(";
  }
}