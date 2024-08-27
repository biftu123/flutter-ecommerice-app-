
import 'dart:convert';

Cartrequstmodel cartrequstmodelFromJson(String str) => Cartrequstmodel.fromJson(json.decode(str));

String cartrequstmodelToJson(Cartrequstmodel data) => json.encode(data.toJson());

class Cartrequstmodel {
    final String productId;
    final int quantity;
    final double totalPrice;
    final List<String> additives;

    Cartrequstmodel({
        required this.productId,
        required this.quantity,
        required this.totalPrice,
        required this.additives,
    });

    factory Cartrequstmodel.fromJson(Map<String, dynamic> json) => Cartrequstmodel(
        productId: json["productId"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"]?.toDouble(),
        additives: List<String>.from(json["additives"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "totalPrice": totalPrice,
        "additives": List<dynamic>.from(additives.map((x) => x)),
    };
}

