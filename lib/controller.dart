import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/user_modal.dart';

class IncrementContrller extends GetxController {
  Dio dio = Dio();
  UserList? userList;

  fetchUserData() async {
    String url = 'https://reqres.in/api/users?page=2';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      debugPrint('${response.data}');
      userList = UserList.fromJson(response.data);
    }
    update();
  }
}
