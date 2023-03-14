import 'package:flutter/material.dart';
import 'package:networking_best_practice/main.dart';
import 'package:networking_best_practice/model/api_response.dart';
import 'package:networking_best_practice/services/user_service.dart';

class UserProvider {
  UserModel? userModel;

  Future<void> getUserModel() async {
    ApiResponse apiResponse = await UserService().getUser();
    if (!apiResponse.dioResponse.isSuccessful) {
      ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBar(content: Text(apiResponse.dioResponse.message)));
      return;
    }
    userModel = apiResponse.data;
  }
}
