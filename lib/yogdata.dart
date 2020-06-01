// To parse this JSON data, do
//
//     final yoga = yogaFromJson(jsonString);

import 'dart:convert';

List<Yoga> yogaFromJson(String str) => List<Yoga>.from(json.decode(str).map((x) => Yoga.fromJson(x)));

String yogaToJson(List<Yoga> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Yoga {
  String lName;
  String description;
  String image;
  List<YItem> yItem;

  Yoga({
    this.lName,
    this.description,
    this.image,
    this.yItem,
  });

  factory Yoga.fromJson(Map<String, dynamic> json) => Yoga(
    lName: json["l_name"],
    description: json["description"],
    image: json["image"],
    yItem: List<YItem>.from(json["y_item"].map((x) => YItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "l_name": lName,
    "description": description,
    "image": image,
    "y_item": List<dynamic>.from(yItem.map((x) => x.toJson())),
  };
}

class YItem {
  String title;
  String hindiTitle;
  String uniqueName;
  int level;
  String imageUrl;
  String description;
  String warnings;

  YItem({
    this.title,
    this.hindiTitle,
    this.uniqueName,
    this.level,
    this.imageUrl,
    this.description,
    this.warnings,
  });

  factory YItem.fromJson(Map<String, dynamic> json) => YItem(
    title: json["title"],
    hindiTitle: json["hindiTitle"],
    uniqueName: json["uniqueName"],
    level: json["level"],
    imageUrl: json["imageUrl"],
    description: json["description"],
    warnings: json["warnings"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "hindiTitle": hindiTitle,
    "uniqueName": uniqueName,
    "level": level,
    "imageUrl": imageUrl,
    "description": description,
    "warnings": warnings,
  };
}
