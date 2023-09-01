class ErrorModel {
  bool? success;
  int? code;
  String? message;
  Data? data;

  ErrorModel({this.success, this.code, this.message, this.data});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? email;
  String? password;
  String? fullName;
  String? username;
  String? dob;
  String? streetAddress;
  String? houseNumber;
  String? postCode;
  String? city;
  String? country;

  Data(
      {this.email,
      this.password,
      this.fullName,
      this.username,
      this.dob,
      this.streetAddress,
      this.houseNumber,
      this.postCode,
      this.city,
      this.country});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
    username = json['username'];
    dob = json['dob'];
    streetAddress = json['streetAddress'];
    houseNumber = json['houseNumber'];
    postCode = json['postCode'];
    city = json['city'];
    country = json['country'];
  }
}
