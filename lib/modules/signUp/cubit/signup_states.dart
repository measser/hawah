

import '../../../models/auth/register_model.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  RegisterModel registerModel;
   SignupSuccessState(this.registerModel);
}

class SignupErrorState extends SignupStates {
  final String error;
  SignupErrorState(this.error);

}

class ChangePasswordVisibilityState extends SignupStates {}
