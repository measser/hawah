import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/models/calender_model.dart';
import 'package:hawwah/models/prediction_model.dart';
import 'package:hawwah/models/risk_model.dart';
import 'package:hawwah/modules/calender/calender_screen.dart';
import 'package:hawwah/modules/home/home_screen.dart';
import 'package:hawwah/modules/prediction/prediction_screen.dart';
import 'package:hawwah/modules/riskCalculator/risk_calculator_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/network/remote/dio_helper.dart';

import '../../models/auth/change_password_model.dart';
import '../../models/auth/profile_model.dart';
import '../../models/report_model.dart';
import '../../models/self_heck_model.dart';
import '../../modules/selfCheck/self_check_screen.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_points.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> activeIcons = [
    Image(
      image: const AssetImage("assets/icons/searching.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/calendar.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/home.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/checklist.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/breast.png"),
      height: 30.0,
      color: thirdColor,
    ),
  ];

  List<BottomNavigationBarItem> bottomNavItems =  [
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/searching.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image: AssetImage("assets/icons/searching.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/calendar.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image:  AssetImage("assets/icons/calendar.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.circle,
        color: Colors.transparent,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/checklist.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image:  AssetImage("assets/icons/checklist.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/breast.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image:  AssetImage("assets/icons/breast.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
  ];

  List<Widget> screens = [
    const PredictionScreen(),
    const CalenderScreen(),
    const HomeScreen(),
    const RiskCalculatorScreen(),
    const IntroSelfCheckScreen1(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }


  Color backgroundColor = secondaryColor;
  Color textColor = thirdColor;
  bool isSelected = false;

  void changeButtonColorState() {
    isSelected = !isSelected;
    backgroundColor = isSelected ? primaryColor : secondaryColor;
    textColor = isSelected ? thirdColor : primaryColor;
    emit(ChangeButtonColorState());
  }




  PredictionModel ?predictionModel;
  void sendPredictionData({
    required String perimeter_mean,
    required String area_mean,
    required String area_se,
    required String perimeter_worst,
    required String area_worst,
  }) {
    emit(LoadingPredictionDataState());
    DioHelper.postData(
      url: PREDICTION,
      token: token,
      data: {
        "perimeter_mean": perimeter_mean,
        "area_mean": area_mean,
        "area_se": area_se,
        "perimeter_worst": perimeter_worst,
        "area_worst": area_worst
      },
    ).then((value) {
      predictionModel = PredictionModel.fromJson(value.data) ;
      emit(SuccessPredictionDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorPredictionDataState());
    });
  }

  RiskModel? riskModel;
  //String toke='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUyNDY2MTA3LCJpYXQiOjE2NTI0NTQxMDcsImp0aSI6IjNiZGE4MTRlNjNjNjQzY2RhMTQ0YWZkNzI1YThkOTQyIiwidXNlcl9pZCI6MTF9.nIzWGVUqJlGxlH1ncAdnKE_RXpqw_g-mAU0R5xDx7-M';
  void sendRiskData({
    required int age,
    required int menarch_age,
    required int live_birth_age,
    required int ever_had_biopsy,
    required int num_biopsy,
    required int first_deg_relatives,
    required int ihyp,
    required int race,
  }) {
    emit(LoadingRiskDataState());
    DioHelper.postData(
      url: RISK_CALCULATOR,
      token: token,
      data: {
        "age": age,
        "menarch_age": menarch_age,
        "live_birth_age": live_birth_age,
        "ever_had_biopsy": ever_had_biopsy,
        "num_biopsy": num_biopsy,
        "first_deg_relatives": first_deg_relatives,
        "ihyp": ihyp,
        "race": race
      },
    ).then((value) {
      riskModel = RiskModel.fromJson(value.data);
      print(value);
      emit(SuccessRiskDataState(riskModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRiskDataState());
    });
  }

  CalenderModel ?calenderModel;
  void sendCalenderData({
    required String data,
  }) {
    emit(LoadingCalenderDataState());
    DioHelper.postData(
      url: SEND_CALENDER_DATA,
      token: token,
      data: {
        "period": data,
        "self_check": "0"
      },
    ).then((value) {
      print(value);
      calenderModel =CalenderModel.fromJson(value.data);
      print(calenderModel!.date!.dates![0].isCheck);
      emit(SuccessCalenderDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCalenderDataState());
    });
  }

  void getCalenderData() {
    emit(LoadingCalenderDataState());
    DioHelper.getData(
      url: GET_CALENDER_DATA,
      token: token,
    ).then((value) {
      print(value);
      calenderModel =CalenderModel.fromJson(value.data);
      print(calenderModel!.date!.dates![0].isCheck);
      emit(SuccessCalenderDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCalenderDataState());
    });
  }


  ReportModel ?reportModel;
  void getReportData() {
    emit(LoadingReportDataState());
    DioHelper.getData(
      url: '/exam/report/',
      token: token,
    ).then((value) {
      print(value);
      reportModel =ReportModel.fromJson(value.data);
      print(reportModel!.questions![0].date);
      emit(SuccessReportDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorReportDataState());
    });
  }



  SelfCheckModel? selfCheckModel;
  void getQuestion() {
    emit(LoadingSelfDataState());
    DioHelper.getData(
        url: '/exam/questians/',token: ' ${token}')
        .then((value) {
      selfCheckModel = SelfCheckModel.fromJson(value.data);
      print(value.data);
      emit(SuccessSelfDataState());
    }).catchError((error) {
      emit(ErrorSelfDataState(error.toString()));
      print('errrrrrrrrrrror***********${error.toString()}');
    });
  }

  void postAnswer({int? id ,String? ans}){
    emit(LoadingAnswerState());
    DioHelper.postData(url:'/exam/questians/',token: ' ${token}',
      data: {
        'self_check':id,
        'answer':ans
      },).then((value){
      selfCheckModel = SelfCheckModel.fromJson(value.data);
      print(value.data);
      emit(SuccessAnswerState());
    }).catchError((error){
      print('errrrrrrrrrrror=========== ${error.toString()}');
      emit(ErrorAnswerState(error));
    });
  }



  ProfileModel? profileModel;
  void getUser() {
    emit(LoadingUserState());
    DioHelper.getData(
        url: '/auth/profile/',token:'${token}')
        .then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(SuccessUserState());
    }).catchError((error) {
      emit(ErrorUserState(error.toString()));
      print('errrrrrrrrrrror ${error.toString()}');
    });
  }

  void updateProfile({
    required String email,
    required String phone,
    required String first_name,
    required String last_name,
    required String birthdate
  }) {
    emit(LoadingUpdateState());
    DioHelper.putData(
        lang: 'ar',
        data: {
          'email':email,
          'phone':phone,
          'first_name':first_name,
          'last_name':last_name,
          'birthdate':birthdate
        },
        url: '/auth/profile/',token: ' ${token}')
        .then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(SuccessUpdateState());
    }).catchError((error) {
      emit(ErrorUpdateState(error.toString()));
      print('errrrrrrrrrrror ${error.toString()}');
    });
  }


  ChangePasswordModel? changePasswordModel;
  void changePassword({
    required String oldpassword,
    required String new_password,
    required String new_password_conf
  }){
    emit(ChangeLoadingState());
    DioHelper.postData(
      url: "/auth/password/change/",
      token: '${token}',
      data: {
        "oldpassword":oldpassword,
        "new_password":new_password,
        "new_password_conf":new_password_conf,
      },).then((value){

      changePasswordModel = ChangePasswordModel.fromJson(value.data);

      emit(ChangeSuccessState(changePasswordModel));
    }).catchError((error){
      print('error henaaaa ${error.toString()}');
      emit(ChangeErrorState(error.toString(),changePasswordModel));
    });
  }


}
