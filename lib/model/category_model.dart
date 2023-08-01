class CategoryModel {
  int? code;
  String? message;
  Data? data;

  CategoryModel({this.code, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  List<Category>? category;
  int? totalCount;
  int? lastPage;

  Data({this.category, this.totalCount, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    data['lastPage'] = lastPage;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? parent;
  String? image;

  Category({this.id, this.name, this.parent, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['parent'] = parent;
    data['image'] = image;
    return data;
  }
}
