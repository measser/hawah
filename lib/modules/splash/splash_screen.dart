import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  final Widget widget;
  const SplashScreen({Key? key, required this.widget}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(248, 157, 185, 1.0),
              Color.fromRGBO(250, 250, 250, 1.0)
            ]),
      ),
      child: SplashScreenView(
        backgroundColor: HexColor("#FAACC3"),
        duration: 6000,
        speed: 200,
        navigateRoute: widget.widget,
        imageSrc: "assets/images/logo.png",
        imageSize: 500,

      ),
    );
  }

}