
import 'dart:convert';

Loginresponsemodel loginresponsemodelFromJson(String str) => Loginresponsemodel.fromJson(json.decode(str));

String loginresponsemodelToJson(Loginresponsemodel data) => json.encode(data.toJson());

class Loginresponsemodel {
    final String id;
    final String username;
    final String email;
    final String phone;
    final bool phoneVerification;
    final String userType;
    final String profile;
    final bool verificationAccount;
    final DateTime createdAt;
    final DateTime updatedAt;
    
    final String usertoken;

    Loginresponsemodel({
        required this.id,
        required this.username,
        required this.email,
        required this.phone,
        required this.phoneVerification,
        required this.userType,
        required this.profile,
        required this.verificationAccount,
        required this.createdAt,
        required this.updatedAt,
        
        required this.usertoken,
    });

    factory Loginresponsemodel.fromJson(Map<String, dynamic> json) => Loginresponsemodel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        profile: json["profile"],
        verificationAccount: json["verificationAccount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        
        usertoken: json["usertoken"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "profile": profile,
        "verificationAccount": verificationAccount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        
        "usertoken": usertoken,
    };
}
