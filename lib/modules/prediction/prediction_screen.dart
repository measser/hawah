import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/shared/components/components.dart';

import 'prediction_result_screen.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}
class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessPredictionDataState) {
          navigateTo(
              context,
              PredictionResultScreen(
                text: HomeCubit.get(context).predictionModel!.data.toString(),
              ));
        }
        if (state is ErrorPredictionDataState) {
          showToast(text: 'برجاء التاكد من البيانات', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        var formKey = GlobalKey<FormState>();
        TextEditingController area_meanController = TextEditingController();
        TextEditingController perimeter_meanController = TextEditingController();
        TextEditingController area_seController = TextEditingController();
        TextEditingController perimeter_worstController = TextEditingController();
        TextEditingController area_worstController = TextEditingController();
        //TextEditingController resultController = TextEditingController();
        return Scaffold(
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
              child: SafeArea(
                child: SingleChildScrollView(
                  // physics: const AlwaysScrollableScrollPhysics(),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'التحليل',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Color.fromRGBO(206, 86, 139, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: const Color.fromRGBO(
                                                253, 220, 230, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(11.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'من فضلك ادخل البيانات المطلوبه';
                                                }
                                              },
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                              controller: area_meanController,
                                              onFieldSubmitted: (value) {
                                                value = area_meanController.text;
                                              },
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "area_mean",
                                                  hintStyle: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromRGBO(
                                                          112, 73, 90, 1))),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: const Color.fromRGBO(
                                                253, 220, 230, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(11.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'من فضلك ادخل البيانات المطلوبه';
                                                }
                                              },
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                              controller: perimeter_meanController,
                                              onFieldSubmitted: (value) {
                                                value = perimeter_meanController.text;
                                              },
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "perimeter_mean",
                                                  hintStyle: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromRGBO(
                                                          112, 73, 90, 1))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: const Color.fromRGBO(
                                                253, 220, 230, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(11.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'من فضلك ادخل البيانات المطلوبه';
                                                }
                                              },
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                              controller: perimeter_worstController,
                                              onFieldSubmitted: (value) {
                                                value = perimeter_worstController.text;
                                              },
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "perimeter_worst",
                                                  hintStyle: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromRGBO(
                                                          112, 73, 90, 1))),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: const Color.fromRGBO(
                                                253, 220, 230, 1.0),
                                            borderRadius:
                                            BorderRadius.circular(11.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'من فضلك ادخل البيانات المطلوبه';
                                                }
                                              },
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                              controller: area_seController,
                                              onFieldSubmitted: (value) {
                                                value = area_seController.text;
                                              },
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "area_se",
                                                  hintStyle: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromRGBO(
                                                          112, 73, 90, 1))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: const Color.fromRGBO(
                                            253, 220, 230, 1.0),
                                        borderRadius:
                                        BorderRadius.circular(11.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'من فضلك ادخل البيانات المطلوبه';
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14),
                                          controller: area_worstController,
                                          onFieldSubmitted: (value) {
                                            value = area_worstController.text;
                                          },
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "area_worst",
                                              hintStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      112, 73, 90, 1))),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Container(
                                    //   height: 50,
                                    //   width: 140,
                                    //   decoration: BoxDecoration(
                                    //     boxShadow: [
                                    //       BoxShadow(
                                    //         color: Colors.grey.withOpacity(0.5),
                                    //         spreadRadius: 5,
                                    //         blurRadius: 7,
                                    //         offset: const Offset(
                                    //             0, 3), // changes position of shadow
                                    //       ),
                                    //     ],
                                    //     color: const Color.fromRGBO(
                                    //         253, 220, 230, 1.0),
                                    //     borderRadius: BorderRadius.circular(11.0),
                                    //   ),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(10),
                                    //     child: TextFormField(
                                    //       validator: (String? value) {
                                    //         if (value!.isEmpty) {
                                    //           return 'من فضلك ادخل البيانات المطلوبه';
                                    //         }
                                    //       },
                                    //       keyboardType: TextInputType.number,
                                    //       textAlign: TextAlign.center,
                                    //       style: TextStyle(fontSize: 22),
                                    //       controller:
                                    //           fractal_dimension_worstController,
                                    //       onFieldSubmitted: (value) {
                                    //         value =
                                    //             fractal_dimension_worstController
                                    //                 .text;
                                    //       },
                                    //       decoration: const InputDecoration(
                                    //           border: InputBorder.none,
                                    //           hintText: "fractal_dimension_worst",
                                    //           hintStyle: TextStyle(
                                    //               fontSize: 14,
                                    //               color: Color.fromRGBO(
                                    //                   112, 73, 90, 1))),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              (state is! LoadingPredictionDataState)
                                  ? defaultButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      HomeCubit.get(context).sendPredictionData(
                                        perimeter_mean: perimeter_meanController.text,
                                        area_mean: area_meanController.text,
                                        area_se: area_seController.text,
                                        perimeter_worst: perimeter_worstController.text,
                                        area_worst: area_worstController.text,
                                      );
                                    }
                                  },
                                  text: 'النتيجه',
                                  radius: 30,
                                  width: MediaQuery.of(context).size.width * .3)
                                  : const Center(
                                  child: CircularProgressIndicator()),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
