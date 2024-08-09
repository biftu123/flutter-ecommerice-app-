
import 'dart:convert';

Apierror apierrorFromJson(String str) => Apierror.fromJson(json.decode(str));

String apierrorToJson(Apierror data) => json.encode(data.toJson());

class Apierror {
    final bool status;
    final String message;

    Apierror({
        required this.status,
        required this.message,
    });

    factory Apierror.fromJson(Map<String, dynamic> json) => Apierror(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
