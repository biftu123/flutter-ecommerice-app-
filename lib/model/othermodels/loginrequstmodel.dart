
import 'dart:convert';

Loginrequstmodel loginrequstmodelFromJson(String str) => Loginrequstmodel.fromJson(json.decode(str));

String loginrequstmodelToJson(Loginrequstmodel data) => json.encode(data.toJson());

class Loginrequstmodel {
    final String email;
    final String password;

    Loginrequstmodel({
        required this.email,
        required this.password,
    });

    factory Loginrequstmodel.fromJson(Map<String, dynamic> json) => Loginrequstmodel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
