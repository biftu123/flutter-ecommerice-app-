
import 'dart:convert';

List<Recomendationfoodmodel> recomendationfoodmodelFromJson(String str) => List<Recomendationfoodmodel>.from(json.decode(str).map((x) => Recomendationfoodmodel.fromJson(x)));

String recomendationfoodmodelToJson(List<Recomendationfoodmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recomendationfoodmodel {
    final String id;
    final String title;
    final String time;
    final String code;
    final String imageUrl;
    final String category;
    final String description;
    final String restaurant;
    final bool isAvailable;
    final List<String> foodType;
    final List<String> foodTags;
    final int rating;
    final double price;
    final List<String> additives;
    final String ratingCount;

    Recomendationfoodmodel({
        required this.id,
        required this.title,
        required this.time,
        required this.code,
        required this.imageUrl,
        required this.category,
        required this.description,
        required this.restaurant,
        required this.isAvailable,
        required this.foodType,
        required this.foodTags,
        required this.rating,
        required this.price,
        required this.additives,
        required this.ratingCount,
    });

    factory Recomendationfoodmodel.fromJson(Map<String, dynamic> json) => Recomendationfoodmodel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        code: json["code"],
        imageUrl: json["imageUrl"],
        category: json["category"],
        description: json["description"],
        restaurant: json["restaurant"],
        isAvailable: json["isAvailable"],
        foodType: List<String>.from(json["foodType"].map((x) => x)),
        foodTags: List<String>.from(json["foodTags"].map((x) => x)),
        rating: json["rating"],
        price: json["price"]?.toDouble(),
        additives: List<String>.from(json["additives"].map((x) => x)),
        ratingCount: json["ratingCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "code": code,
        "imageUrl": imageUrl,
        "category": category,
        "description": description,
        "restaurant": restaurant,
        "isAvailable": isAvailable,
        "foodType": List<dynamic>.from(foodType.map((x) => x)),
        "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
        "rating": rating,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x)),
        "ratingCount": ratingCount,
    };
}
