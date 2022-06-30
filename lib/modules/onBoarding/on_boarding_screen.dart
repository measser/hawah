

import 'package:flutter/material.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:hawwah/shared/network/local/cache_helper.dart';
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import 'model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Model> pages = [
    Model(
      image: 'assets/images/onboarding/onboarding1.png',
      title: '',
      body: '',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding2.png',
      title: 'الكشف المبكر ',
      body:
          'اجراء الفحوصات الطبيه مبكرا قادرة على انقاذ حياتك واحتواء المرض ان وجد ',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding3.png',
      title: 'انتى مش لوحدك',
      body: 'انتى اهم فرد فى المجتمع صحتك تهمنا كلنا معاكى ',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding4.png',
      title: 'الفحص الذاتى ',
      body:
          'من الخطوات المهمه اللى ممكن تعمليها فى البيت للتأكد من عدم وجود تكتلات او أورام',
    ),
    Model(
      image: "assets/images/onboarding/onboarding5.png",
      title: "انتـى فد التحدى",
      body: 'متيأسيش لانك اقوى من اى مرض انتى قد التحدى ',
    ),
    Model(
      image: "assets/images/onboarding/onboarding6.png",
      title: "التوعيه مهمه",
      body: 'لازم الكل يعرف اهميه التوعيه لأنها ممكن تنقذ حياة شخص اخر',
    ),
  ];
  var pageController = PageController();
  bool isLast = false;
  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateToAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(248, 157, 185, 1.0),
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                submit();
              },
              child: const Text(
                "تخــطى",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ))
        ],
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
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == pages.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoarderItem(pages[index]),
                    itemCount: pages.length,
                    controller: pageController,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    dotColor: secondaryColor,
                    dotHeight: 10,
                    expansionFactor: 2,
                    dotWidth: 10,
                    activeDotColor: thirdColor,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (isLast) {
                          submit();
                        } else {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 5,
                            color:Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                            backgroundColor: secondaryColor,
                            radius: 30,
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 40,
                            )
                            ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget buildBoarderItem(Model pages) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              pages.image,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            pages.title,
            style: TextStyle(
              fontSize: 30,
           fontWeight: FontWeight.bold,
           color: thirdColor
           //   fontFamily: "MyFlutterApp",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            pages.body,
            style: TextStyle(
              fontSize: 20,
                color: thirdColor
             // fontFamily: "MyFlutterApp",
            ),
          )
        ],
      );
}
