
import 'dart:convert';

List<Cartresponsemodel> cartresponsemodelFromJson(String str) => List<Cartresponsemodel>.from(json.decode(str).map((x) => Cartresponsemodel.fromJson(x)));

String cartresponsemodelToJson(List<Cartresponsemodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cartresponsemodel {
    final String id;
    final String userId;
    final ProductId productId;
    final List<dynamic> additive;
    final int quantity;
    final double totalPrice;
    final int v;

    Cartresponsemodel({
        required this.id,
        required this.userId,
        required this.productId,
        required this.additive,
        required this.quantity,
        required this.totalPrice,
        required this.v,
    });

    factory Cartresponsemodel.fromJson(Map<String, dynamic> json) => Cartresponsemodel(
        id: json["_id"],
        userId: json["userId"],
        productId: ProductId.fromJson(json["productId"]),
        additive: List<dynamic>.from(json["additive"].map((x) => x)),
        quantity: json["quantity"],
        totalPrice: json["totalPrice"]?.toDouble(),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "productId": productId.toJson(),
        "additive": List<dynamic>.from(additive.map((x) => x)),
        "quantity": quantity,
        "totalPrice": totalPrice,
        "__v": v,
    };
}

class ProductId {
    final String id;
    final String title;
    final String imageUrl;
    final Restaurant restaurant;
    final int rating;
    final String ratingCount;

    ProductId({
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.restaurant,
        required this.rating,
        required this.ratingCount,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        rating: json["rating"],
        ratingCount: json["ratingCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "imageUrl": imageUrl,
        "restaurant": restaurant.toJson(),
        "rating": rating,
        "ratingCount": ratingCount,
    };
}

class Restaurant {
    final Coords coords;
    final String id;
    final String time;

    Restaurant({
        required this.coords,
        required this.id,
        required this.time,
    });

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        coords: Coords.fromJson(json["coords"]),
        id: json["_id"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "coords": coords.toJson(),
        "_id": id,
        "time": time,
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
