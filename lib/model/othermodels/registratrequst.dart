

import 'dart:convert';

Registrationrequstmodel registrationrequstmodelFromJson(String str) => Registrationrequstmodel.fromJson(json.decode(str));

String registrationrequstmodelToJson(Registrationrequstmodel data) => json.encode(data.toJson());

class Registrationrequstmodel {
    final String username;
    final String email;
    final String password;

    Registrationrequstmodel({
        required this.username,
        required this.email,
        required this.password,
    });

    factory Registrationrequstmodel.fromJson(Map<String, dynamic> json) => Registrationrequstmodel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
    };
}
