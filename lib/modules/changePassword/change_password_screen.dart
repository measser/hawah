import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/login/cubit/login_cubit.dart';
import 'package:hawwah/modules/login/cubit/login_states.dart';
import 'package:hawwah/shared/components/components.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var confirmPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              background(),
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 40.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "انشــاء رقم سرى جديد",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(206, 86, 139, 1),
                                ),
                              ),
                              IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                  icon: const Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(206, 86, 139, 1),),
                              )
                            ],
                          ),
                          const SizedBox(height: 15.0,),
                          const Text(
                            "يجب ان يكون القم السرى الجديد مختلف عن الرقم القديم ويكون اكثر من 8 عناصر",
                            style: TextStyle(
                              fontSize: 20.0,

                              color: Color.fromRGBO(206, 86, 139, 1),
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                           const Text(
                            "الرقم السرى",
                            style: TextStyle(fontSize: 30.0, color:Color.fromRGBO(206, 86, 139, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          defaultFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            hintText: "ادخل الرقم السرى الجديد ",
                            // onSubmit: (value) {
                            //   if (formKey.currentState!.validate()) {
                            //     LoginCubit.get(context).userLogin(
                            //       email: emailController.text,
                            //       password: passController.text,
                            //     );
                            //   }
                            // },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'الرقم السرى غير صحيح ';
                              }
                              return "";
                            },
                            prefix: Icons.lock_outline,
                             suffix: LoginCubit.get(context).suffix,
                            obscureText: LoginCubit.get(context).isPassword,
                            suffixPressed: (){
                             LoginCubit.get(context).changePasswordVisibility();
                            }
                          ),
                          const SizedBox(height: 40.0,),
                           const Text(
                            "تأكيد الرقم السرى",
                            style: const TextStyle(
                                fontSize: 30.0,
                                color:Color.fromRGBO(206, 86, 139, 1),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          defaultFormField(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.text,
                            hintText: "ادخل الرقم السرى الخاص بك ",
                            // onSubmit: (value) {
                            //   if (formKey.currentState!.validate()) {
                            //     LoginCubit.get(context).userLogin(
                            //       email: emailController.text,
                            //       password: passController.text,
                            //     );
                            //   }
                            // },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'الرقم السرى غير صحيح ';
                              }
                              return "";
                            },
                            prefix: Icons.lock_outline,
                             suffix: LoginCubit.get(context).suffix,
                             obscureText: LoginCubit.get(context).isPassword,
                             suffixPressed: (){
                               LoginCubit.get(context).changePasswordVisibility();
                             }
                          ),
                          const SizedBox(height: 40.0,),
                          //Bottom
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                print("tapped");
                              },
                              child: Container(
                                width:260,
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration:  BoxDecoration(
                                  color:  const Color.fromRGBO(250, 172, 195, 1),
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                                ),
                                child: const Text(
                                  'إعادة تعيين الرقم السرى',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
);
  }

  Widget background() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(250, 167, 192, 1.0),
              Color.fromRGBO(253, 216, 227, 1.0)
            ]),
      ),
    );
  }

  void bottomSheet(BuildContext context,) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 450,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(249, 157, 185, 1.0),
                      Color.fromRGBO(253, 220, 230, 1.0)
                    ]),
              ),
              child: Scaffold(
                body: Container(
                  height: 450,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(249, 157, 185, 1.0),
                          Color.fromRGBO(253, 220, 230, 1.0)
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'تغير كلمة السر',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                      const Text(
                        'ادخل البريد الالكتروني المرتبط بحسابك و سنرسل اليك تعليمات لاعاده تعيين كلمه المرور عبر البريد الالكتروني',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: const Color.fromRGBO(253, 220, 230, 1.0),
                            borderRadius: BorderRadius.circular(70.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 5, bottom: 5),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "ادخال البريد الالكترونى",
                                labelStyle: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 150),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: const Center(
                                child: Text(
                                  'ارسل التعليمات ',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 23,
                                    color: Color(0xffffffff),
                                    letterSpacing: 3.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(206, 86, 139, 1.0),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
