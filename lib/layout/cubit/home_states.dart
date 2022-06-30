part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeBottomNavBarState extends HomeStates {}
class ChangeButtonColorState extends HomeStates {}

class LoadingPredictionDataState extends HomeStates {}

class SuccessPredictionDataState extends HomeStates {}

class ErrorPredictionDataState extends HomeStates {}

class LoadingRiskDataState extends HomeStates {}

class SuccessRiskDataState extends HomeStates {
  final RiskModel riskModel;

  SuccessRiskDataState(this.riskModel);
}

class ErrorRiskDataState extends HomeStates {}

class LoadingCalenderDataState extends HomeStates {}

class SuccessCalenderDataState extends HomeStates {}

class ErrorCalenderDataState extends HomeStates {}

class LoadingReportDataState extends HomeStates {}

class SuccessReportDataState extends HomeStates {}

class ErrorReportDataState extends HomeStates {}


////////////////////////


class LoadingSelfDataState extends HomeStates {}

class SuccessSelfDataState extends HomeStates {}

class ErrorSelfDataState extends HomeStates
{
  final String? error;

  ErrorSelfDataState(this.error);
}
class LoadingAnswerState extends HomeStates {}

class SuccessAnswerState extends HomeStates {}

class ErrorAnswerState extends HomeStates
{
  final String? error;

  ErrorAnswerState(this.error);
}

class LoadingUserState extends HomeStates {}

class SuccessUserState extends HomeStates {}

class ErrorUserState extends HomeStates {
  final String? error;

  ErrorUserState(this.error);
}

class LoadingUpdateState extends HomeStates {}

class SuccessUpdateState extends HomeStates {}

class ErrorUpdateState extends HomeStates {
  final String? error;

  ErrorUpdateState(this.error);
}
class ChangeLoadingState extends HomeStates {}

class ChangeSuccessState extends HomeStates {
  final ChangePasswordModel? changePasswordModel;

  ChangeSuccessState(this.changePasswordModel);

}

class ChangeErrorState extends HomeStates {
  final String? error;
  final ChangePasswordModel? changePasswordModel;

  ChangeErrorState(this.error,this.changePasswordModel);
}