class HTTPModel<T>{
  final T? data;
  bool internetStatus = true;
  bool successful = false;
  final String? message;

  HTTPModel({this.data, this.internetStatus = true, this.successful = false, this.message});
}