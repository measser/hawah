
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/modules/signUp/cubit/signup_cubit.dart';
import 'package:hawwah/modules/signUp/cubit/signup_states.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/components/components.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController birthdateController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? myDate ;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupStates>(
        listener: (context, state)
        {


          if (state is SignupSuccessState) {
            if (state.registerModel.status!) {
              navigateToAndFinish(context, LoginScreen());
              showToast(
                text: state.registerModel.message!,
                state: ToastStates.SUCCESS,
              );
            }else
            {
              showToast(
                text: state.registerModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(248, 157, 185, 1.0),
                        Color.fromRGBO(250, 250, 250, 1.0)
                      ]),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/logo_white.png",
                              fit: BoxFit.contain,
                              height: 200.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'الرجاء ادخال اسم المستخدم';
                                          }
                                          return null;
                                        },
                                        controller: firstNameController,
                                        cursorColor: thirdColor,
                                        decoration: InputDecoration(
                                          hintText: "الاسم الاول",
                                          hintStyle: TextStyle(
                                              color: thirdColor),
                                          fillColor: secondaryColor,
                                          filled: true,
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: thirdColor,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0),
                                              borderSide: BorderSide(
                                                  color: secondaryColor,
                                                  width: 2)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0),
                                              borderSide: BorderSide(
                                                  color: secondaryColor,
                                                  width: 2)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'الرجاء ادخال اسم العائلة';
                                          }
                                          return null;
                                        },
                                        controller: lastNameController,
                                        cursorColor: primaryColor,
                                        decoration: InputDecoration(
                                          hintText: "اسم العائلة ",
                                          hintStyle: TextStyle(
                                              color: thirdColor),
                                          fillColor: secondaryColor,
                                          filled: true,
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: thirdColor,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0),
                                              borderSide: BorderSide(
                                                  color: secondaryColor,
                                                  width: 2)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0),
                                              borderSide: BorderSide(
                                                  color: secondaryColor,
                                                  width: 2)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),

                                InkWell(
                                  onTap: () {
                                    showIOSDatePicker(context: context,);
                                  },
                                  child:
                                  Container(
                                    height: 70,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: secondaryColor,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    ),

                                    child: defaultFormField(
                                        prefix: Icons.date_range,
                                        keyboardType: const TextInputType.numberWithOptions(),
                                        controller: birthdateController,
                                        hintText: "تاريخ الميلاد",
                                        hintColor: Colors.white,
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2050))
                                              .then((value) {
                                            String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(value!);
                                            birthdateController.text = formattedDate;
                                          },);
                                        },
                                        prefixColor: Colors.white,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return " يجب إدخال تاريخ الميلاد";
                                          }
                                          return null;
                                        }),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),


                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  validator: (String? value) {
                                    if (value!.isEmpty || value.length < 11) {
                                      return 'رقم الهاتف غير صحيح ';
                                    }
                                    return null;
                                  },
                                  controller: phoneController,
                                  cursorColor: thirdColor,
                                  decoration: InputDecoration(
                                    hintText: "ادخل رقم الهاتف الخاص بك ",
                                    hintStyle: TextStyle(color: primaryColor),
                                    fillColor: secondaryColor,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: primaryColor,
                                    ),
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

                                const SizedBox(
                                  height: 20.0,
                                ),
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
                                    hintStyle: TextStyle(color: primaryColor),
                                    fillColor: secondaryColor,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: primaryColor,
                                    ),
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

                                const SizedBox(
                                  height: 20.0,
                                ),
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
                                  obscureText: SignupCubit
                                      .get(context)
                                      .isPassword,
                                  decoration: InputDecoration(
                                    hintText: "ادخل كلمة المرور الخاصة بك ",
                                    hintStyle: TextStyle(color: primaryColor),
                                    fillColor: secondaryColor,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: primaryColor,
                                    ),
                                    suffixIcon: SignupCubit
                                        .get(context)
                                        .suffix != null
                                        ? IconButton(
                                      color: primaryColor,
                                      onPressed: () {
                                        SignupCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      icon: Icon(

                                        SignupCubit
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

                                const SizedBox(
                                  height: 10.0,
                                ),
                                ConditionalBuilder(
                                  builder: (context)=>defaultButton(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    text: 'إنشـاء حساب',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        SignupCubit.get(context).userRegister(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            first_name: firstNameController.text,
                                            last_name: lastNameController.text,
                                            phone: phoneController.text,
                                            birthdate: birthdateController.text);
                                      }
                                    },
                                    radius: 30.0,
                                    // width: MediaQuery.of(context).size.width ,
                                  ),
                                  condition:state is! SignupLoadingState,
                                  fallback: (context)=>const Center(child: CircularProgressIndicator()),),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "-  لديك حساب بالفعل؟",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color.fromRGBO(
                                            248, 157, 185, 1.0),
                                      ),
                                    ),
                                    defaultTextButton(
                                      onPressed: () {
                                        navigateToAndFinish(
                                            context, LoginScreen());
                                      },
                                      text: "تسجيل الدخول",
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
                ),
              ));
        },
      ),
    );
  }



  final f = DateFormat('yyyy-MM-dd');

  showIOSDatePicker({BuildContext? context}) {
    return showCupertinoModalPopup(
      context: context!,
      builder: (c) {
        return Container(
          height: 360,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: 300,
                child: CupertinoDatePicker(

                  maximumDate: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2000, 1, 1),
                  minimumDate: DateTime(1960, 1, 1),
                  minimumYear: 1955,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      myDate= f.format(newDateTime);
                    });
                  },
                ),
              ),
              defaultButton(
                radius: 30,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .7,
                onPressed: () => Navigator.pop(context),
                text: "تأكيد",
                fontSize: 24,
              ),
            ],
          ),
        );
      },
    );
  }
}

