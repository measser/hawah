
import '../../../models/auth/forget_pssword_model.dart';
import '../../../models/auth/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel? loginModel;

  LoginSuccessState(this.loginModel);

}

class LoginErrorState extends LoginStates {
  final String? error;
  LoginErrorState(this.error,);
}

class ChangePasswordVisibilityState extends LoginStates {}

class ForgetLoadingState extends LoginStates {}

class ForgetSuccessState extends LoginStates {
  final ForgetModel? forgetModel;

  ForgetSuccessState(this.forgetModel);

}

class ForgetErrorState extends LoginStates {
  final String? error;
  final ForgetModel? forgetModel;


  ForgetErrorState(this.error,this.forgetModel);
}

