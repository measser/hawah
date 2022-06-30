import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/modules/calender/model.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  var dayController = TextEditingController();
  var monthController = TextEditingController();
  var yearController = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessCalenderDataState) {
          showToast(text: 'تم حفظ البيانات بنجاح', state: ToastStates.SUCCESS);
        }
        if (state is ErrorCalenderDataState) {
          showToast(
              text: 'فشل في حفظ البيانات تاكد من البيانات المدخله',
              state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              //_background(),
              _body(),
            ],
          ),
        ));
      },
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(248, 157, 185, 1.0),
                Color.fromRGBO(250, 250, 250, 1.0)
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (BuildContext context, int index) {
                  return _checkItem(days[index].color, days[index].title);
                },
              ),
            ),
            _buttonCalender(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(170, 207, 207, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    ' اليوم',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 75,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(239, 79, 147, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'يوم الفحص',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            _squareImage(),
            const SizedBox(
              height: 23,
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkItem(Color? color, String? title) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Center(
          child: Text(
            '${title}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _buttonCalender() {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children: [
          const Center(
            child: Text(
              '  ادخل  تاريخ اول أيام الحيض \n          \"الدوره الشهريه\" ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                shadows: [
                  Shadow(
                      color: Colors.black38,
                      blurRadius: 1.2,
                      offset: Offset(3, 3)),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              dialog(context);
            },
            icon: Image.asset(
              'assets/images/calender/circle_logo.png',
              width: 350,
              height: 350,
            ),
            iconSize: 400,
          ),
        ],
      ),
    );
  }

  void dialog(BuildContext context, {Day? day}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(-348989),
                border: Border.all(color: Colors.white, width: 3)

                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: InkWell(
                //           onTap: () {
                //             dayController.clear();
                //             monthController.clear();
                //             yearController.clear();
                //             int i = 0;
                //             for (i; i < days.length; i++) {
                //               if (days[i].isChecked == true) {
                //                 setState(() {
                //                   days[i].color = Colors.white;
                //                   if (i + 1 >= days.length) {
                //                     days[days.length - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 1].color = Colors.white;
                //                   }
                //                   if (i + 2 >= days.length) {
                //                     print((i + 2) - days.length);
                //                     days[(i + 2) - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 2].color = Colors.white;
                //                   }
                //                   if (i + 3 >= days.length) {
                //                     print((i + 3) - days.length);
                //                     days[(i + 3) - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 3].color = Colors.white;
                //                   }
                //                   if (i + 4 >= days.length) {
                //                     print((i + 4) - days.length);
                //                     days[(i + 4) - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 4].color = Colors.white;
                //                   }
                //                   if (i + 5 >= days.length) {
                //                     print((i + 5) - days.length);
                //                     days[(i + 5) - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 5].color = Colors.white;
                //                   }
                //                   if (i + 6 >= days.length) {
                //                     print((i + 6) - days.length);
                //                     days[(i + 6) - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 6].color = Colors.white;
                //                   }
                //                   if (i + 7 >= days.length) {
                //                     print((i + 7) - days.length);
                //                     days[(i + 7) - days.length].color = Colors.white;
                //                   } else {
                //                     days[i + 7].color = Colors.white;
                //                   }
                //                 });
                //               }
                //             }
                //           },
                //           child: const Icon(
                //             Icons.restart_alt_outlined,
                //             size: 40,
                //             color: Colors.white,
                //           )),
                //     ),
                //     const SizedBox(
                //       height: 30,
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    '  ادخل  تاريخ اول أيام الحيض \n          \"الدوره الشهريه\" ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                            color: Colors.black38,
                            blurRadius: 1.2,
                            offset: Offset(3, 3)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'اليوم',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'الشهر',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'السنه',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: TextFormField(
                        controller: dayController,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        onChanged: (value) {
                          value = dayController.text;
                        },
                        // onFieldSubmitted: (value) {
                        //   int i = 0;
                        //   setState(() {
                        //     for (i; i < days.length; i++) {
                        //       if (value.toString() == days[i].title) {
                        //         days[i].isChecked = true;
                        //         days[i].color = Color.fromRGBO(170, 207, 207, 1);
                        //         if (i + 7 >= days.length) {
                        //           days[days.length - days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         } else {
                        //           days[i + 7].color = Color.fromRGBO(239, 79, 147, 1);
                        //         }
                        //         if (i + 8 >= days.length) {
                        //           print((i + 8) - days.length);
                        //           days[(i + 8) - days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         } else {
                        //           days[i + 8].color = Color.fromRGBO(239, 79, 147, 1);
                        //         }
                        //         if (i + 9 >= days.length) {
                        //           print((i + 9) - days.length);
                        //           days[(i + 9) - days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         } else {
                        //           days[i + 9].color = Color.fromRGBO(239, 79, 147, 1);
                        //         }
                        //         if (i + 10 >= days.length) {
                        //           print((i + 10) - days.length);
                        //           days[(i + 10) - days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         } else {
                        //           days[i + 10].color = Color.fromRGBO(239, 79, 147, 1);
                        //         }
                        //         // if (i + 5 >= days.length) {
                        //         //   print((i+5)-days.length);
                        //         //   days[(i+5)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         // } else {
                        //         //   days[i + 5].color = Color.fromRGBO(239, 79, 147, 1);
                        //         // }
                        //         // if (i + 6 >= days.length) {
                        //         //   print((i+6)-days.length);
                        //         //   days[(i+6)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         // } else {
                        //         //   days[i + 6].color = Color.fromRGBO(239, 79, 147, 1);
                        //         // }
                        //         // if (i + 7 >= days.length) {
                        //         //   print((i+7)-days.length);
                        //         //   days[(i+7)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                        //         // } else {
                        //         //   days[i + 7].color = Color.fromRGBO(239, 79, 147, 1);
                        //         // }
                        //       }
                        //     }
                        //   });
                        // },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(26, 14, 4, 14),
                          filled: true,
                          // hintText: 'اليوم',
                          // hintStyle: TextStyle(
                          //   color: Colors.white,
                          // ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(248, 157, 185, 1.0),
                                width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(248, 157, 185, 1.0),
                                width: 0.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: TextFormField(
                        controller: monthController,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        onChanged: (value) {
                          value = monthController.text;
                          // print(monthController.text);
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(26, 14, 4, 14),
                          filled: true,
                          // hintText: 'الشهر',
                          // hintStyle: TextStyle(
                          //   color: Colors.white,
                          // ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(248, 157, 185, 1.0),
                                width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(248, 157, 185, 1.0),
                                width: 0.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: TextFormField(
                        controller: yearController,
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        onChanged: (value) {
                          value = yearController.text;
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(26, 14, 4, 14),
                          filled: true,
                          // hintText: 'السنه',
                          // hintStyle: TextStyle(
                          //   color: Colors.white,
                          // ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(248, 157, 185, 1.0),
                                width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(248, 157, 185, 1.0),
                                width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: defaultButton(
                    onPressed: () {
                      int i = 0;
                      setState(() {
                        for (i; i < days.length; i++) {
                          if (dayController.text == days[i].title) {
                            days[i].isChecked = true;
                            days[i].color = Color.fromRGBO(170, 207, 207, 1);
                            if (i + 7 >= days.length) {
                              days[days.length - days.length].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 7].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 8 >= days.length) {
                              print((i + 8) - days.length);
                              days[(i + 8) - days.length].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 8].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 9 >= days.length) {
                              print((i + 9) - days.length);
                              days[(i + 9) - days.length].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 9].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 10 >= days.length) {
                              print((i + 10) - days.length);
                              days[(i + 10) - days.length].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 10].color =
                                  Color.fromRGBO(239, 79, 147, 1);
                            }
                          }
                        }
                      });
                      if (yearController.text != '' &&
                          monthController.text != '' &&
                          dayController.text != '') {
                        HomeCubit.get(context).sendCalenderData(
                            data:
                                '${yearController.text}-${monthController.text}-${dayController.text}');
                      } else {
                        showToast(
                            text: 'من فضلك ادخل البيانات المطلوبه',
                            state: ToastStates.ERROR);
                      }
                      print(
                          '${yearController.text}-${monthController.text}-${dayController.text}');
                    },
                    text: 'تاكيد',
                    radius: 20.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        );
      },
    );
  }

  _squareImage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.2),
            width: 370,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  opacity: 0.3,
                  image: AssetImage(
                      "assets/images/calender/calender_background.png"),
                ),
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: thirdColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 50.0),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '  يجب اجراء الفحص الذاتي \n بعد الانتهاء من فترة الحيض كل شهر  (في اليوم السابع الي اليوم العاشر من الحيض)',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(206, 86, 139, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'في حالة وجود رضاعة طبيعية يتم اجراء  الفحص بعد فترة الرضاعة عندما يكون  الثدي فارغاً من الحليب',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(206, 86, 139, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'في حالة انقطاع الحيض بشكل مؤقت  او دائم (الحمل او سن اليأس) يتم تحديد يوم حسب الرغبة خلال الشهر علي سبيل المثال  اليوم الأول من كل شهر ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(206, 86, 139, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Container(
              child: Center(
                child: Text(
                  '  متى يجب إجراء \nالفحص الذاتى ؟ ',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: thirdColor,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                  "assets/images/cloud.png",
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
