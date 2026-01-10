// To parse this JSON data, do
//
//     final responseApiModel = responseApiModelFromJson(jsonString);

import 'dart:convert';

ResponseApiModel responseApiModelFromJson(String str) =>
    ResponseApiModel.fromJson(json.decode(str));

String responseApiModelToJson(ResponseApiModel data) =>
    json.encode(data.toJson());

class ResponseApiModel {
  bool? status;
  int? statusCode;
  String? message;
  dynamic data;
  dynamic rawData;

  ResponseApiModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.rawData,
  });

  factory ResponseApiModel.fromJson(Map<String, dynamic> json) =>
      ResponseApiModel(
        // token: json["data"]?['body'] ?? '',
        status: json["status"] == 1 || json["status"] == 200 ? true : false,
        statusCode: json['statusCode'] ?? 0,
        message: json["message"] ?? '',
        data: json["data"] ?? '',
        rawData: json,
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "message": message,
    "data": data,
    "rawData": rawData,
  };
}
