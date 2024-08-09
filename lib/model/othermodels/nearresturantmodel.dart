
import 'dart:convert';

List<Nearrestuantmodel> nearrestuantmodelFromJson(String str) => List<Nearrestuantmodel>.from(json.decode(str).map((x) => Nearrestuantmodel.fromJson(x)));

String nearrestuantmodelToJson(List<Nearrestuantmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nearrestuantmodel {
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final String owner;
    final String logoUrl;
    final String ratingCount;
    final String code;
    final String verification;
    final String verificationMessage;
    final List<String> food;
    final bool isAvailability;
    final bool delivery;
    final bool pickup;
    final int rating;
    final Coords coords;

    Nearrestuantmodel({
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.owner,
        required this.logoUrl,
        required this.ratingCount,
        required this.code,
        required this.verification,
        required this.verificationMessage,
        required this.food,
        required this.isAvailability,
        required this.delivery,
        required this.pickup,
        required this.rating,
        required this.coords,
    });

    factory Nearrestuantmodel.fromJson(Map<String, dynamic> json) => Nearrestuantmodel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        owner: json["owner"],
        logoUrl: json["logoUrl"],
        ratingCount: json["ratingCount"],
        code: json["code"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        food: List<String>.from(json["food"].map((x) => x)),
        isAvailability: json["isAvailability"],
        delivery: json["delivery"],
        pickup: json["pickup"],
        rating: json["rating"],
        coords: Coords.fromJson(json["coords"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "owner": owner,
        "logoUrl": logoUrl,
        "ratingCount": ratingCount,
        "code": code,
        "verification": verification,
        "verificationMessage": verificationMessage,
        "food": List<dynamic>.from(food.map((x) => x)),
        "isAvailability": isAvailability,
        "delivery": delivery,
        "pickup": pickup,
        "rating": rating,
        "coords": coords.toJson(),
    };
}

class Coords {
    final String address;
    final String title;
    final double longitude;
    final double latitude;
    final int longitudeDelta;
    final int latitudeDelta;

    Coords({
        required this.address,
        required this.title,
        required this.longitude,
        required this.latitude,
        required this.longitudeDelta,
        required this.latitudeDelta,
    });

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        address: json["address"],
        title: json["title"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"],
        latitudeDelta: json["latitudeDelta"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "title": title,
        "longitude": longitude,
        "latitude": latitude,
        "longitudeDelta": longitudeDelta,
        "latitudeDelta": latitudeDelta,
    };
}
