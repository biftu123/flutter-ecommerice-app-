
import 'dart:convert';

Cartrequstmodel cartrequstmodelFromJson(String str) => Cartrequstmodel.fromJson(json.decode(str));

String cartrequstmodelToJson(Cartrequstmodel data) => json.encode(data.toJson());

class Cartrequstmodel {
    final String productId;
    final List<String> additives;
    final int quantity;
    final double totalPrice;

    Cartrequstmodel({
        required this.productId,
        required this.additives,
        required this.quantity,
        required this.totalPrice,
    });

    factory Cartrequstmodel.fromJson(Map<String, dynamic> json) => Cartrequstmodel(
        productId: json["productId"],
        additives: List<String>.from(json["additives"].map((x) => x)),
        quantity: json["quantity"],
        totalPrice: json["totalPrice"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "additives": List<dynamic>.from(additives.map((x) => x)),
        "quantity": quantity,
        "totalPrice": totalPrice,
    };
}
