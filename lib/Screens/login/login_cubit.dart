import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_round/Modal/Login/login_modal.dart';
import 'package:technical_round/Repositories/Login/login_impl_repository.dart';
import 'package:technical_round/Screens/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  MethodChannel methodChannel = MethodChannel('');
  Platform  platform = Platform();  
  LoginImplRepository loginRepository = LoginImplRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoginLoading());
    try {
      final user = await loginRepository.login(email, password);
      if (user == null) {
        emit(LoginFailure());
      } else {
        LoginModal loginModal = LoginModal.fromJson(user);
        prefs.setString('user', jsonEncode(loginModal.toJson()));
        // Get.toNamed(RouteName.verification);
      }
      debugPrint('User is : $user');
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure());
    }
  }
}
