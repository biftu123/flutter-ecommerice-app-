
import 'dart:convert';

List<Allcatagory> allcatagoryFromJson(String str) => List<Allcatagory>.from(json.decode(str).map((x) => Allcatagory.fromJson(x)));

String allcatagoryToJson(List<Allcatagory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allcatagory {
    final String id;
    final String title;
    final String imageUrl;
    final String value;

    Allcatagory({
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.value,
    });

    factory Allcatagory.fromJson(Map<String, dynamic> json) => Allcatagory(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "imageUrl": imageUrl,
        "value": value,
    };
}
