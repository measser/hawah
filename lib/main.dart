import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/modules/onBoarding/on_boarding_screen.dart';
import 'package:hawwah/modules/search/search_doctor.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/modules/splash/splash_screen.dart';
import 'package:hawwah/shared/bloc_observer.dart';
import 'package:hawwah/shared/components/themes.dart';
import 'package:hawwah/shared/network/local/cache_helper.dart';
import 'package:hawwah/shared/network/remote/dio_helper.dart';
import 'modules/signUp/sign_up_screen.dart';
//z
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget? widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    widget = SplashScreen(
      widget: LoginScreen(),
    );
  } else {
    widget = SplashScreen(
      widget: OnBoardingScreen(),
    );
  }
  runApp(MyApp(
   startWidget: widget,
  ));
}
class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({Key? key,
    this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          HomeCubit()..getQuestion()..getUser()..getReportData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: lightMode,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'),
        ],
        home: startWidget,
      ),
    );
  }
}
