class ErrorModel{
  String code;
  String description;

  ErrorModel({required this.code,required this.description});

  factory ErrorModel.fromJson(Map<String, dynamic> json){
    late dynamic newCode;
    if(json["code"] is int){
      newCode = "Status Code: ${json["code"]}";
    }else{
      newCode = json["code"];
    }
    String newMessage = json["message"] ?? (json["status"] ?? "");
    return ErrorModel(
      code: newCode,
      description: newMessage,
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": description,
  };
}