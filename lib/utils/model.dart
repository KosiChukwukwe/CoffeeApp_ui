// To parse this JSON data, do
//
//     final coffeeType = coffeeTypeFromJson(jsonString);

import 'dart:convert';

List<CoffeeType> coffeeTypeFromJson(String str) =>
    List<CoffeeType>.from(json.decode(str).map((x) => CoffeeType.fromJson(x)));

String coffeeTypeToJson(List<CoffeeType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoffeeType {
  String title;
  String description;
  List<String?>? ingredients;
  String image;
  int id;

  CoffeeType({
    required this.title,
    required this.description,
    this.ingredients,
    required this.image,
    required this.id,
  });

  factory CoffeeType.fromJson(Map<String, dynamic> json) => CoffeeType(
        title: json["title"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "image": image,
        "id": id,
      };
  @override
  String toString() {
    return 'title: $title\n'
        'description: $description\n'
        'image: $image\n'
        'id: $id\n';
  }
}
