
import 'dart:convert';

List<Catagorymodel> catagorymodelFromJson(String str) => List<Catagorymodel>.from(json.decode(str).map((x) => Catagorymodel.fromJson(x)));

String catagorymodelToJson(List<Catagorymodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catagorymodel {
    final String id;
    final String title;
    final String imageUrl;
    final String value;
    

    Catagorymodel({
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.value,
      
    });

    factory Catagorymodel.fromJson(Map<String, dynamic> json) => Catagorymodel(
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
