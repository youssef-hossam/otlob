class ErrorModel {
  int statusCode;
  String message;
  List<String> errors;

  ErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    List<String> errorsList = [];
    json['errors'].forEach((key, value) {
      errorsList.add('$key: ${value.join('\n')}');
    });
    return ErrorModel(
      statusCode: json['statusCode'],
      message: json['message'],
      errors: errorsList,
    );
  }
}