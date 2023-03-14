// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:networking_best_practice/model/dio_response.dart';

class ApiResponse<T> {
  final T data;
  final DioResponse dioResponse;
  ApiResponse({
    required this.data,
    required this.dioResponse,
  });

  ApiResponse<T> copyWith({
    T? data,
    DioResponse? dioResponse,
  }) {
    return ApiResponse<T>(
      data: data ?? this.data,
      dioResponse: dioResponse ?? this.dioResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'dioResponse': dioResponse.toMap(),
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse<T>(
      data: map['data'],
      dioResponse: DioResponse.fromMap(map['dioResponse'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) => ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ApiResponse(data: $data, dioResponse: $dioResponse)';

  @override
  bool operator ==(covariant ApiResponse<T> other) {
    if (identical(this, other)) return true;

    return other.data == data && other.dioResponse == dioResponse;
  }

  @override
  int get hashCode => data.hashCode ^ dioResponse.hashCode;
}
