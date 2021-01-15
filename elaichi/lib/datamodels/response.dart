// To parse JSON data, do
//
//     final response = responseFromJson(jsonString);

// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

import 'package:elaichi/datamodels/data.dart';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

/// Any GraphQL response can passed through this to get model data.
class Response {
  Response({
    this.data,
  });

  Data data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}
