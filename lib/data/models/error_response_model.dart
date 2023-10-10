class ErrorResponseData {
  ErrorResponseData({
    this.message,
    this.code,
  });

  ErrorResponseData.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
  }
  String? message;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    return map;
  }
}

class ErrorResponseModel {
  ErrorResponseModel({
    this.error,
  });

  ErrorResponseModel.fromJson(dynamic json) {
    error = json['error'] != null
        ? ErrorResponseData.fromJson(json['error'])
        : null;
  }
  ErrorResponseData? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    return map;
  }
}
