import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workapp/helpers/dio.dart';
import 'package:workapp/screens/auth/login/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workapp/widgets/toast.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoggedInLoading = false;
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    isLoggedInLoading = true;
    emit(LoginLoading());
    await DioHelper.postData(path: 'login', data: {
      'email': emailController.text,
      'password': passwordController.text
    }).then((value) {
      if (value!.data['status'] == 'success') {
        customToast(value!.data['message']);
      }
      emit(LoginSuccess());
      isLoggedInLoading = false;
      customToast(value!.data['message']);
    }).catchError((e) {
      emit(LoginError());
      isLoggedInLoading = false;
    });
  }
}
