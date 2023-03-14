// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DioResponse {
  final Map data;
  final bool isSuccessful;
  final int statusCode;
  final String message;
  DioResponse({
    required this.data,
    required this.isSuccessful,
    required this.statusCode,
    required this.message,
  });

  DioResponse copyWith({
    Map? data,
    bool? isSuccessful,
    int? statusCode,
    String? message,
  }) {
    return DioResponse(
      data: data ?? this.data,
      isSuccessful: isSuccessful ?? this.isSuccessful,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'isSuccessful': isSuccessful,
      'statusCode': statusCode,
      'message': message,
    };
  }

  factory DioResponse.fromMap(Map<String, dynamic> map) {
    return DioResponse(
      data: Map.from((map['data'] as Map)),
      isSuccessful: map['isSuccessful'] as bool,
      statusCode: map['statusCode'] as int,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DioResponse.fromJson(String source) => DioResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DioResponse(data: $data, isSuccessful: $isSuccessful, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(covariant DioResponse other) {
    if (identical(this, other)) return true;

    return mapEquals(other.data, data) && other.isSuccessful == isSuccessful && other.statusCode == statusCode && other.message == message;
  }

  @override
  int get hashCode {
    return data.hashCode ^ isSuccessful.hashCode ^ statusCode.hashCode ^ message.hashCode;
  }
}
