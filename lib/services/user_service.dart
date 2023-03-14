// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:networking_best_practice/model/api_response.dart';
import 'package:networking_best_practice/model/dio_response.dart';
import 'package:networking_best_practice/services/dio_service.dart';

class UserService {
  Future<ApiResponse<UserModel>> getUser() async {
    DioResponse dioResponse = await DioService().request('users/1');

    return ApiResponse(
      data: UserModel(data: dioResponse.data),
      dioResponse: dioResponse,
    );
  }

  Future<ApiResponse<OnurModel>> getOnur() async {
    DioResponse dioResponse = await DioService().request('users/1');
    if (!dioResponse.isSuccessful) {}

    return ApiResponse(
      data: OnurModel(isGay: dioResponse.data['isGay'] as bool),
      dioResponse: dioResponse,
    );
  }
}

class OnurModel {
  final bool isGay;
  OnurModel({
    required this.isGay,
  });

  OnurModel copyWith({
    bool? isGay,
  }) {
    return OnurModel(
      isGay: isGay ?? this.isGay,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isGay': isGay,
    };
  }

  factory OnurModel.fromMap(Map<String, dynamic> map) {
    return OnurModel(
      isGay: map['isGay'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnurModel.fromJson(String source) => OnurModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OnurModel(isGay: $isGay)';

  @override
  bool operator ==(covariant OnurModel other) {
    if (identical(this, other)) return true;

    return other.isGay == isGay;
  }

  @override
  int get hashCode => isGay.hashCode;
}

class UserModel {
  final Map data;
  UserModel({
    required this.data,
  });

  UserModel copyWith({
    Map? data,
  }) {
    return UserModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      data: Map.from((map['data'] as Map)),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(data: $data)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
