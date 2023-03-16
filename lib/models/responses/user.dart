// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
    Response({
        this.message,
        this.data,
    });

    String? message;
    User? data;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"],
        data: json["data"] == null ? null : User.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.nick,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.token,
        this.password
    });

    int? id;
    String? name;
    String? email;
    String? nick;
    dynamic rememberToken;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? token;
    String? password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        nick: json["nick"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "nick": nick,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "token": token,
    };

    Map<String, String> createUser() => {
        "name": name!,
        "email": email!,
        "nick": nick!,
        "password": password!,
        "password_confirmation": password!
    };

    Map<String, String> credentials() => {
        "email": email!,
        "password": password!,
        "password_confirmation": password!
    };
}
