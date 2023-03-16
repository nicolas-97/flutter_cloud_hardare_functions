// To parse this JSON data, do
//
//     final responseBad = responseBadFromJson(jsonString);

import 'dart:convert';

BadResponse responseBadFromJson(String str) => BadResponse.fromJson(json.decode(str));

String responseBadToJson(BadResponse data) => json.encode(data.toJson());

class BadResponse {
    BadResponse({
        this.message,
        this.errors,
    });

    String? message;
    Map<dynamic, dynamic>? errors;

    factory BadResponse.fromJson(Map<String, dynamic> data) => BadResponse(
        message: data["message"],
        errors: data["errors"] == null ? null : data['errors'],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors,
    };
}