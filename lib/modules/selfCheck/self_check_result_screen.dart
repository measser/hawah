import 'package:flutter/material.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class SelfCheckResultScreen extends StatelessWidget {
  const SelfCheckResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "نتيجة الاختبار",
          style: TextStyle(
              color: thirdColor, fontSize: 35.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(248, 157, 185, 1.0),
                Color.fromRGBO(250, 250, 250, 1.0)
              ]),
        ),
        child: Stack(
          children: [
            const Center(
              child: Image(
                height: 500,
                width: 500.0,
                image: AssetImage(
                  "assets/images/selfCheckResult.png",
                ),
              ),
            ),
            Center(
              child: Text(
                "اذا استمرت هذه الأعراض \n  لمده اسبوعين يجب التوجه\n الى اقرب طبيب متخصص",
                style: TextStyle(
                    color: thirdColor,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 40.0,
              right: 100,
              child: GestureDetector(
                child: Container(
                  width: 200.0,
                  height: 50,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                      child: Text(
                    "تــم",
                    style: TextStyle(fontSize: 30.0, color: thirdColor),
                  )),
                ),
                onTap: () {
                  navigateToAndFinish(context, const HomeLayout());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
