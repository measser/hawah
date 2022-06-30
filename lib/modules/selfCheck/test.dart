import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';

import '../../layout/home_layout.dart';
import '../../models/self_heck_model.dart';
import '../../shared/components/colors.dart';
import '../../shared/components/components.dart';
import 'self_check_screen.dart';

class SelfCheckTest extends StatefulWidget {
  const SelfCheckTest({Key? key}) : super(key: key);

  @override
  State<SelfCheckTest> createState() => _SelfCheckTestState();
}

class _SelfCheckTestState extends State<SelfCheckTest> {
  SelfCheckModel? model;
  bool isSelected = false;
  @override
  Widget build(BuildContext context ) {
    return BlocProvider(
      create: (context,) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! LoadingSelfDataState,
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
            builder: (context,) {
              return Scaffold(
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
                  child:  SingleChildScrollView(
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
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                '${model!.data!.question!.elementAt(0).question}',
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
                                                    color: isSelected?primaryColor:Colors.white,
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
                                                    color: isSelected?primaryColor:Colors.white,
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
                                          backgroundImage: AssetImage("assets/images/selfCheck/self1.png"),
                                          maxRadius: 50.0,
                                        )
                                      ],
                                    )
                                  ],
                                ),
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
                )
              );
            }
          );
        },
      ),
    );
  }
}
