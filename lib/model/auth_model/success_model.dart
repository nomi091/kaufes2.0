class SuccessModel {
  bool? success;
  int? code;
  String? message;
  Data? data;

  SuccessModel({this.success, this.code, this.message, this.data});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? role;
  String? email;
  String? fullName;
  String? username;
  String? phoneNumber;
  String? salutation;
  String? dob;
  List<Addresses>? addresses;
  bool? isProfileComplete;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  bool? isGovernmentIdVerified;
  String? accountStatus;
  String? createdAt;

  User(
      {this.id,
      this.role,
      this.email,
      this.fullName,
      this.username,
      this.phoneNumber,
      this.salutation,
      this.dob,
      this.addresses,
      this.isProfileComplete,
      this.isEmailVerified,
      this.isPhoneVerified,
      this.isGovernmentIdVerified,
      this.accountStatus,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    email = json['email'];
    fullName = json['fullName'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    salutation = json['salutation'];
    dob = json['dob'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    isProfileComplete = json['isProfileComplete'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    isGovernmentIdVerified = json['isGovernmentIdVerified'];
    accountStatus = json['accountStatus'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['email'] = email;
    data['fullName'] = fullName;
    data['username'] = username;
    data['phoneNumber'] = phoneNumber;
    data['salutation'] = salutation;
    data['dob'] = dob;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['isProfileComplete'] = isProfileComplete;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    data['isGovernmentIdVerified'] = isGovernmentIdVerified;
    data['accountStatus'] = accountStatus;
    data['createdAt'] = createdAt;
    return data;
  }

  //@override
  // String toString() {
  //   return ' {id: $id, role: $role, email: $email, fullName: $fullName, username: $username, phoneNumber: $phoneNumber, salutation: $salutation, dob: $dob, addresses: $addresses, isProfileComplete: $isProfileComplete, isEmailVerified: $isEmailVerified, isPhoneVerified: $isPhoneVerified, isGovernmentIdVerified: $isGovernmentIdVerified, accountStatus: $accountStatus, createdAt: $createdAt}';
  // }
}

class Addresses {
  String? streetAddress;
  String? houseNumber;
  String? postCode;
  String? city;
  String? country;

  Addresses(
      {this.streetAddress,
      this.houseNumber,
      this.postCode,
      this.city,
      this.country});

  Addresses.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    houseNumber = json['houseNumber'];
    postCode = json['postCode'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['streetAddress'] = streetAddress;
    data['houseNumber'] = houseNumber;
    data['postCode'] = postCode;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}
