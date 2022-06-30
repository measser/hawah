import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/models/self_heck_model.dart';
import 'package:hawwah/modules/selfCheck/self_check_result_screen.dart';
import 'package:hawwah/modules/selfCheck/self_check_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FirstSteps extends StatefulWidget {
  const FirstSteps({Key? key}) : super(key: key);

  @override
  State<FirstSteps> createState() => _FirstStepsState();
}

class _FirstStepsState extends State<FirstSteps> {
  List<Map<String, dynamic>> answers = [
    {'value': 0, 'label': "نعم"},
    {'value': 1, 'label': "لا"},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LoadingSelfDataState,
          builder: (context) =>
              selfCheckBuild(HomeCubit.get(context).selfCheckModel!, context),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget selfCheckBuild(SelfCheckModel? model, context) =>
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              navigateToAndFinish(context,  HomeLayout());
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "الاختبار الأول",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // height:MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BuildSelfCheckQuItem(
                        question:
                            '${model!.data!.question!.elementAt(0).question}',
                        image: "assets/images/selfCheck/self1.png",
                        onPressed1: () {
                            HomeCubit.get(context).postAnswer(
                                id: model.data!.question!.elementAt(0).id,
                                ans: 'True');
                        },
                        onPressed0: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(0).id,
                              ans: 'False');
                        },
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.4,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      BuildSelfCheckQuItem(
                        question:
                            '${model.data!.question!.elementAt(1).question}',
                        image: "assets/images/selfCheck/self2.png",
                        onPressed1: () {

                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(1).id,
                              ans: 'True');
                        },
                        onPressed0: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(1).id,
                              ans: 'False ');
                        },
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.4,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      //
                      BuildSelfCheckQuItem(
                        question:
                            '${model.data!.question!.elementAt(2).question}',
                        image: "assets/images/selfCheck/self3.png",
                        onPressed1: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(2).id,
                              ans: 'True');
                        },
                        onPressed0: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(2).id,
                              ans: 'False');
                        },
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.4,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      BuildSelfCheckQuItem(
                        question:
                            '${model.data!.question?.elementAt(3).question}',
                        image: "assets/images/selfCheck/self3.png",
                        onPressed1: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(3).id,
                              ans: 'True');
                        },
                        onPressed0: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(3).id,
                              ans: 'False');
                        },
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.4,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      BuildSelfCheckQuItem(
                          question:
                              '${model.data!.question!.elementAt(4).question}',
                          image: "assets/images/selfCheck/self5.png",
                          onPressed1: () {

                            HomeCubit.get(context).postAnswer(
                                id: model.data!.question!.elementAt(4).id,
                                ans: 'True');
                            return Alert(
                              style: AlertStyle(
                                backgroundColor: primaryColor,
                                animationType: AnimationType.fromTop,
                                isCloseButton: false,
                                // isOverlayTapDismiss: false,
                                descTextAlign: TextAlign.start,
                                animationDuration:
                                    const Duration(milliseconds: 400),
                                alertBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  side: const BorderSide(
                                      color: Colors.white, width: 3),
                                ),
                                descStyle: TextStyle(
                                  color: secondaryColor,
                                  // fontSize: 15
                                ),
                                titleStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                                alertAlignment: Alignment.center,
                              ),
                              context: context,
                              title: 'يجب ان تذهبي الي الطبيب في الحال.',
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    navigateToAndFinish(context,  HomeLayout());
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.pink.shade50,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black87.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child:const Center(
                                      child:  Text(
                                       "حســنا",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ).show();
                          },
                          onPressed0: () {
                            HomeCubit.get(context).postAnswer(
                                id: model.data!.question!.elementAt(4).id,
                                ans: 'False');
                          }),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.4,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      BuildSelfCheckQuItem(
                        question:
                            '${model.data!.question!.elementAt(5).question}',
                        image: "assets/images/selfCheck/self6.png",
                        onPressed1: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(5).id,
                              ans: 'True');
                        },
                        onPressed0: () {
                          HomeCubit.get(context).postAnswer(
                              id: model.data!.question!.elementAt(5).id,
                              ans: 'False');
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: defaultButton(
                            onPressed: () {
                              navigateTo(
                                  context, const IntroSelfCheckScreen2());
                            },
                            text: "التــالى",
                            fontSize: 30,
                            width: 150.0,
                            radius: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );



  // Widget buildSelfCheckQuItem({
  //   required String question,
  //   required String image,
  //   required Function onPressed1,
  //   required Function onPressed0,
  //   String selectAnswerQ = "",
  //   int selectAnswerValueQ = 0,
  //   bool isSelected = false,
  // }) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Text(
  //           question,
  //           style: TextStyle(
  //               color: thirdColor, fontSize: 18.0, fontWeight: FontWeight.bold),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Center(
  //               child: Row(
  //                 children: [
  //                   GestureDetector(
  //                     onTap:(){
  //                       onPressed1();
  //                       HomeCubit.get(context).changeButtonColorState;
  //                       },
  //                     child: Container(
  //                       width: 100,
  //                       decoration: BoxDecoration(
  //                         border: Border.all(
  //                           color:  secondaryColor ,
  //                           width: 3,
  //                         ),
  //                         borderRadius: BorderRadius.circular(20.0),
  //                         color: primaryColor,
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           "نــعم",
  //                           style: TextStyle(
  //                             color: thirdColor,
  //                             fontSize: 18.0,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   GestureDetector(
  //                     onTap:(){
  //                       onPressed0();
  //                       HomeCubit.get(context).changeButtonColorState;
  //                       isSelected = !isSelected;
  //                       },
  //                     child: Container(
  //                       width: 100,
  //                       decoration: BoxDecoration(
  //                         border: Border.all(
  //                           color:  secondaryColor ,
  //                           width: 3,
  //                         ),
  //                         borderRadius: BorderRadius.circular(20.0),
  //                         color: HomeCubit.get(context).backgroundColor,
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           "لا",
  //                           style: TextStyle(
  //                             color: thirdColor,
  //                             fontSize: 18.0,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             CircleAvatar(
  //               backgroundColor: secondaryColor,
  //               backgroundImage: AssetImage(image),
  //               maxRadius: 50.0,
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}

class BuildSelfCheckQuItem extends StatefulWidget {
  final String question;
  final String image;
  final Function onPressed1;
  final Function onPressed0;
  const BuildSelfCheckQuItem({Key? key, required this.question, required this.image, required this.onPressed1, required this.onPressed0,}) : super(key: key);

  @override
  State<BuildSelfCheckQuItem> createState() => _BuildSelfCheckQuItemState();
}

class _BuildSelfCheckQuItemState extends State<BuildSelfCheckQuItem> {
  final String selectAnswerQ="";

  final int selectAnswerValueQ=0;
  late  bool isSelected= false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.question,
            style: TextStyle(
                color: thirdColor, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        setState(() {
                          widget.onPressed1();
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:  secondaryColor ,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: isSelected?secondaryColor:primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "نــعم",
                            style: TextStyle(
                              color: thirdColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap:(){
                        setState(() {
                          widget.onPressed0();
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:  secondaryColor ,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color:isSelected?primaryColor:secondaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "لا",
                            style: TextStyle(
                              color: thirdColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: secondaryColor,
                backgroundImage: AssetImage(widget.image),
                maxRadius: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}



class SecondSteps extends StatefulWidget {
  const SecondSteps({Key? key}) : super(key: key);

  @override
  State<SecondSteps> createState() => _SecondStepsState();
}

class _SecondStepsState extends State<SecondSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الاختبار الثانى",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SecondScreen(HomeCubit.get(context).selfCheckModel!),
    );
  }

  Widget SecondScreen(SelfCheckModel model) => Container(
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
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildSelfCheckQuItem(
                    question: '${model.data!.question!.elementAt(6).question}',
                    image: "assets/images/selfCheck/self7.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(
                          id: model.data!.question!.elementAt(6).id,
                          ans: 'True');
                    },
                    onPressed0: () {
                      HomeCubit.get(context).postAnswer(
                          id: model.data!.question!.elementAt(6).id,
                          ans: 'False');
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  BuildSelfCheckQuItem(
                    question: '${model.data!.question!.elementAt(7).question}',
                    image: "assets/images/selfCheck/self3.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(
                          id: model.data!.question!.elementAt(7).id,
                          ans: 'True');
                    },
                    onPressed0: () {
                      HomeCubit.get(context).postAnswer(
                          id: model.data!.question!.elementAt(7).id,
                          ans: 'False');
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  BuildSelfCheckQuItem(
                    question: '${model.data!.question!.elementAt(8).question}',
                    image: "assets/images/selfCheck/self9.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(
                          id: model.data!.question!.elementAt(8).id,
                          ans: 'True');
                    },
                    onPressed0: () {
                      HomeCubit.get(context).postAnswer(
                          id: model.data!.question!.elementAt(8).id,
                          ans: 'False');
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  const Spacer(),
                  Center(
                    child: defaultButton(
                        onPressed: () {
                          navigateToAndFinish(
                              context, const SelfCheckResultScreen());
                        },
                        text: "تــم",
                        fontSize: 30,
                        width: 150.0,
                        radius: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      );


}





// child: Wrap(
//   alignment: WrapAlignment.center,
//   spacing: 15,
//   children: answers.map((answer) {
//     bool isSelected =
//         selectAnswerQ ==
//             answer['label'];
//     final forgroundColor = !isSelected
//         ? Colors.white
//         : thirdColor;
//     final backgroundColor = isSelected
//         ? primaryColor
//         : secondaryColor;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//
//           selectAnswerQ = answer['label'];
//           selectAnswerValueQ = answer['value'];
//           isSelect = true;
//         });
//         print(selectAnswerValueQ);
//         print(selectAnswerQ);
//       },
//       child: Chip(
//         shape: const StadiumBorder(
//             side: BorderSide(
//               color: Colors.white,
//             )),
//         label: Text(
//           answer['label'],
//           style: TextStyle(
//             color: forgroundColor,
//           ),
//         ),
//         backgroundColor: isSelected? backgroundColor : Colors.red,
//       ),
//     );
//   }).toList(),
// ),