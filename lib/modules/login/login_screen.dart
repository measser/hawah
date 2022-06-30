import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/login/cubit/login_cubit.dart';
import 'package:hawwah/modules/login/cubit/login_states.dart';
import 'package:hawwah/modules/signUp/sign_up_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/network/local/cache_helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var forgetController = TextEditingController();
  var passwordController = TextEditingController();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState)
          {
            if(state.loginModel!.status!){
              CacheHelper.saveData(
                  key: 'token', value: state.loginModel!.userData!.tokens!.access)
                  .then((value) {
                token = state.loginModel!.userData!.tokens!.access!;
                HomeCubit.get(context).getUser();
                HomeCubit.get(context).getQuestion();
                navigateToAndFinish(context,  HomeLayout());
                showToast(text: "تم تسجيل الدخول بنجاح", state: ToastStates.SUCCESS);
              });
            }else{
              showToast(text: state.loginModel!.messege!, state: ToastStates.ERROR);}}
          if (state is ForgetSuccessState) {
            showToast(
                text: state.forgetModel!.messege!, state: ToastStates.SUCCESS);
            navigateToAndFinish(context, LoginScreen());
          } else if (state is ForgetErrorState) {
            showToast(text: 'Email incorrect', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Image.asset(
                        "assets/images/logo_white.png",
                        fit: BoxFit.contain,
                        height: 200.0,
                        width: 400,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تســجيل الدخول",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: thirdColor),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),


                          // Email=======================================================
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'البريد الالكترونى غير صحيح ';
                              } else if (!value.contains('@')) {
                                return 'البريد الالكترونى غير صحيح ';
                              }
                              return null;
                            },
                            controller: emailController,
                            cursorColor: thirdColor,
                            decoration: InputDecoration(
                              hintText: "ادخل البريد الالكترونى الخاص بك ",
                              hintStyle: TextStyle(color: thirdColor),
                              fillColor: secondaryColor,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: thirdColor,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          // Password===================================================
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'كلمة المرور غير صحيحة';
                              } else if (value.length < 5) {
                                return 'كلمة المرور قصيرة برجاء ادخال كلمة مرور أكبر';
                              }
                              return null;
                            },
                            controller: passwordController,
                            cursorColor: thirdColor,
                            obscureText: LoginCubit
                                .get(context)
                                .isPassword,
                            decoration: InputDecoration(
                              hintText: "ادخل كلمة المرور الخاصة بك ",
                              hintStyle: TextStyle(color: thirdColor),
                              fillColor: secondaryColor,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: thirdColor,
                              ),
                              suffixIcon: LoginCubit
                                  .get(context)
                                  .suffix != null
                                  ? IconButton(
                                color: thirdColor,
                                onPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(

                                  LoginCubit
                                      .get(context)
                                      .suffix,
                                ),
                              )
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0),
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0),
                                  borderSide: BorderSide(
                                      color: secondaryColor, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                            ),
                          ),
                          //=====================popup============================
                          defaultTextButton(
                            onPressed: () {
                              return Alert(
                                style: AlertStyle(
                                  backgroundColor: primaryColor,
                                  animationType: AnimationType.fromTop,
                                  isCloseButton: false,
                                  isOverlayTapDismiss: false,
                                  descTextAlign: TextAlign.start,
                                  animationDuration: const Duration(milliseconds: 400),
                                  alertBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: const BorderSide(
                                      color: Colors.white,
                                      width: 3
                                    ),
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
                                title: "تغير كلمه السر",
                                desc:
                                    "ادخل البريد الالكتروني المرتبط بحسابك و سنسل اليك تعليمات لاعاده تعيين كلمه المرور عبر البريد الالكتروني",
                                content: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'البريد الالكترونى غير صحيح ';
                                      } else if (!value.contains('@')) {
                                        return 'البريد الالكترونى غير صحيح ';
                                      }
                                      return null;
                                    },
                                    controller: forgetController,
                                    cursorColor: thirdColor,
                                    decoration: InputDecoration(
                                      hintText:
                                          "ادخل بريدك الالكتروني ",
                                      hintStyle: const TextStyle(color: Color(-4812642)),
                                      fillColor: secondaryColor,
                                      filled: true,
                                      // prefixIcon: Icon(
                                      //   Icons.email_outlined,
                                      //   color: thirdColor,
                                      // ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: BorderSide(
                                              color: secondaryColor, width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: BorderSide(
                                              color: secondaryColor, width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2)),
                                    ),
                                  ),
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () {
                                      LoginCubit.get(context).forgetPassword(
                                          email: forgetController.text);
                                      // navigateTo(
                                      //     context, const ChangePassword());
                                    },
                                    child: const Text(
                                      "ارسل التعليمات",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        height: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    radius: BorderRadius.circular(25),
                                    color: primaryColor,
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.pink.shade50,
                                    ),
                                  ),
                                ],
                              ).show();
                            },
                            text: "نسيت كلمه المرور؟",
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                           ConditionalBuilder(
                             condition:state is! LoginLoadingState ,
                             fallback:(context)=>const Center(child: CircularProgressIndicator()) ,
                             builder: (context)=>defaultButton(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.0,
                               text: 'تسجيل الدخول',
                               onPressed: () {
                                 if (formKey.currentState!.validate()) {
                                   LoginCubit.get(context).userLogin(
                                     email: emailController.text,
                                     password: passwordController.text,
                                   );
                                 }
                               },
                               radius: 30.0,
                               // width: MediaQuery.of(context).size.width ,
                             ),
                           ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "- ليس لديك حساب؟",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(248, 157, 185, 1.0),
                                ),
                              ),
                              defaultTextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignupScreen()));
                                },
                                text: "انشاء حساب",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
