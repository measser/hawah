import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/shared/network/end_points.dart';
import 'package:hawwah/shared/network/remote/dio_helper.dart';
import '../../../models/auth/forget_pssword_model.dart';
import '../../../models/auth/login_model.dart';
import 'login_states.dart';
class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);
  LoginModel? loginModel;
  void userLogin({
  required String email,
    required String password,
}){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          "email":email,
        "password":password,
        },).then((value){
          loginModel = LoginModel.fromJson(value.data);
          print(value.data);
          emit(LoginSuccessState(loginModel));
    }).catchError((error){
          print(error.toString());
          emit(LoginErrorState(error.toString()));
        });}

  ForgetModel? forgetModel;
  void forgetPassword({
    required String email,
  }){
    emit(ForgetLoadingState());
    DioHelper.postData(
      url: FORGET_PASSWORD,
      data: {
        "email":email,
      },).then((value){
      print(value.data);
      forgetModel = ForgetModel.fromJson(value.data);
      emit(ForgetSuccessState(forgetModel!));
    }).catchError((error){
      print(error);
      print('error henaaaa ${error.toString()}');
      emit(ForgetErrorState(error.toString(),forgetModel));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

}

