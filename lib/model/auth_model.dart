class AuthModel {
  int? code;
  String? message;
  Data? data;

  AuthModel({this.code, this.message, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? role;
  String? email;
  String? firstName;
  String? lastName;
  Address? address;
  String? imageUrl;
  String? phoneNumber;
  String? registerChannel;
  bool? isProfileComplete;
  bool? bIsPhoneVerified;
  bool? bIsEmailVerified;
  bool? bIsVerified;
  int? iActiveAds;
  int? iItemsSold;
  String? createdAt;
  String? companyName;
  String? websiteLink;
  CompanyLocation? companyLocation;

  User(
      {this.id,
      this.role,
      this.email,
      this.firstName,
      this.lastName,
      this.address,
      this.imageUrl,
      this.phoneNumber,
      this.registerChannel,
      this.isProfileComplete,
      this.bIsPhoneVerified,
      this.bIsEmailVerified,
      this.bIsVerified,
      this.iActiveAds,
      this.iItemsSold,
      this.createdAt,
      this.companyName,
      this.websiteLink,
      this.companyLocation});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    imageUrl = json['imageUrl'];
    phoneNumber = json['phoneNumber'];
    registerChannel = json['registerChannel'];
    isProfileComplete = json['isProfileComplete'];
    bIsPhoneVerified = json['_isPhoneVerified'];
    bIsEmailVerified = json['_isEmailVerified'];
    bIsVerified = json['_isVerified'];
    iActiveAds = json['_activeAds'];
    iItemsSold = json['_itemsSold'];
    createdAt = json['createdAt'];
    companyName = json['companyName'];
    websiteLink = json['websiteLink'];
    companyLocation = json['companyLocation'] != null
        ? CompanyLocation.fromJson(json['companyLocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['imageUrl'] = imageUrl;
    data['phoneNumber'] = phoneNumber;
    data['registerChannel'] = registerChannel;
    data['isProfileComplete'] = isProfileComplete;
    data['_isPhoneVerified'] = bIsPhoneVerified;
    data['_isEmailVerified'] = bIsEmailVerified;
    data['_isVerified'] = bIsVerified;
    data['_activeAds'] = iActiveAds;
    data['_itemsSold'] = iItemsSold;
    data['createdAt'] = createdAt;
    data['companyName'] = companyName;
    data['websiteLink'] = websiteLink;
    if (companyLocation != null) {
      data['companyLocation'] = companyLocation!.toJson();
    }
    return data;
  }
}

class Address {
  String? country;
  String? state;
  String? city;
  String? street;
  String? postalCode;

  Address({this.country, this.state, this.city, this.street, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['street'] = street;
    data['postalCode'] = postalCode;
    return data;
  }
}

class CompanyLocation {
  double? lat;
  double? lng;

  CompanyLocation({this.lat, this.lng});

  CompanyLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
