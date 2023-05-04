import 'dart:convert';

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int? id;
  String? categoryName;
  String? categoryImage;
  String? categoryType;
  DateTime? createdOn;

  Welcome({
    this.id,
    this.categoryName,
    this.categoryImage,
    this.categoryType,
    this.createdOn,
  });

  factory Welcome.fromJson(Map<dynamic, dynamic> json) => Welcome(
    id: json["id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    categoryType: json["category_type"],
    createdOn: DateTime.parse(json["created_on"]),
  );

  Map<dynamic, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_image": categoryImage,
    "category_type": categoryType,
    "created_on": createdOn?.toIso8601String(),
  };
}


