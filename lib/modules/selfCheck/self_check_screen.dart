import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/modules/selfCheck/self_check_steps.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:splash_screen_view/SplashScreenView.dart';




class IntroSelfCheckScreen1 extends StatelessWidget {
  const IntroSelfCheckScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return SplashScreenView(
          backgroundColor: HexColor("#FAACC3"),
          duration: 3000,
          speed: 200,
          navigateRoute: SelfCheckScreen1(),
          imageSrc: "assets/images/selfCheck/first_step.png",
          imageSize: 300,
          text: "الاختــبار الأول أمام المراه",
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            shadows: [
              Shadow(
                  color: Colors.black38,
                  blurRadius: 1.2,
                  offset: Offset(3, 3)),
            ],
          ),
        );
      },
    );
  }
}
class SelfCheckScreen1 extends StatefulWidget {
  const SelfCheckScreen1({Key? key}) : super(key: key);
  @override
  _SelfCheckScreen1State createState() => _SelfCheckScreen1State();
}
class _SelfCheckScreen1State extends State<SelfCheckScreen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstSteps(),
    );
  }
}



class IntroSelfCheckScreen2 extends StatelessWidget {
  const IntroSelfCheckScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (contetx,state){},
      builder: (context,state){
        return SplashScreenView(
          backgroundColor: HexColor("#FAACC3"),
          duration: 3000,
          speed: 200,
          navigateRoute: SelfCheckScreen2(),
          imageSrc: "assets/images/selfCheck/second_step2.png",
          imageSize: 300,
          text: "الاختــبار الثانى اثناء الاستحمام او الاستلقاء",
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            shadows: [
              Shadow(
                  color: Colors.black38,
                  blurRadius: 1.2,
                  offset: Offset(3, 3)),
            ],
          ),
        );
      },
    );
  }
}
class SelfCheckScreen2 extends StatefulWidget {
  const SelfCheckScreen2({Key? key}) : super(key: key);
  @override
  _SelfCheckScreen2State createState() => _SelfCheckScreen2State();
}

class _SelfCheckScreen2State extends State<SelfCheckScreen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SecondSteps(),
    );
  }
}