import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/modules/changePassword/change_password_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {

  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var nameController2 = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var birthController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  // var numberController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is ChangeSuccessState) {
          if (state.changePasswordModel!.success != null) {
            showToast(
              text: state.changePasswordModel!.success!,
              state: ToastStates.SUCCESS,
            );
            Navigator.pop(context);
          }else {
            showToast(
              text: state.changePasswordModel!.messege!,
              state: ToastStates.ERROR,);}}},
      builder: (context, state) {
        var model = HomeCubit
            .get(context)
            .profileModel;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: SizedBox(
              height: 400,
              child: Stack(
                children: [
                  AppBar(leading: IconButton(
                    onPressed: () {Navigator.pop(context);},
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(200)),
                    ),
                    backgroundColor: const Color.fromRGBO(206, 86, 139, 1),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink, width: 2),
                          shape: BoxShape.circle),
                      height: 150,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 50,
                        child: Image.asset(
                          'assets/icons/profile_pic.png',
                          fit: BoxFit.fill,
                          height: 70,
                          width: 70,),),),),],),),),
          backgroundColor: const Color.fromRGBO(248, 157, 185, 1.0),
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
            child: ConditionalBuilder(
              builder: (context) {
                nameController.text = '${model!.data!.elementAt(0).firstName}';
                nameController2.text = '${model.data!.elementAt(0).lastName}';
                emailController.text = '${model.data!.elementAt(0).email}';
                phoneController.text = '${model.data!.elementAt(0).phone}';
                birthController.text = '${model.data!.elementAt(0).birthdate}';
                return Profile(context,state);
              },
              condition: model != null,
              fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }

  Widget Profile(context,state) =>
      Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Name formField ....
                if (state is LoadingUpdateState)
                  const LinearProgressIndicator(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55.0,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 192, 209, 1),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),

                        child: defaultFormField(
                            prefix: Icons.person,
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            hintText: "الاســم",
                            hintColor: Colors.white,
                            prefixColor: Colors.white,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return " يجب إدخال الاسم بصوره صحيحة";
                              }
                              return null;
                            }),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 55.0,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 192, 209, 1),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),

                        child: defaultFormField(
                            prefix: Icons.person,
                            keyboardType: TextInputType.text,
                            controller: nameController2,
                            hintText: "الاســم",
                            hintColor: Colors.white,
                            prefixColor: Colors.white,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return " يجب إدخال الاسم بصوره صحيحة";
                              }
                              return null;
                            }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // Email FormField...
                Container(
                  height: 55.0,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 192, 209, 1),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(
                            0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: defaultFormField(
                      prefix: Icons.email,
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      hintText: "البريد الإلكترونى",
                      hintColor: Colors.white,
                      prefixColor: Colors.white,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return " يجب إدخال البريد الالكتروني";
                        }
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),

                //Phone FormField ...
                Container(
                  height: 55.0,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 192, 209, 1),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(
                            0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: defaultFormField(
                      prefix: Icons.phone,
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      hintText: "رقم الهاتف",
                      hintColor: Colors.white,
                      prefixColor: Colors.white,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return " يجب إدخال الرقم صحيح";
                        }
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),

                // birthDate ...
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55.0,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 192, 209, 1),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: defaultFormField(
                            prefix: Icons.date_range,
                            keyboardType: const TextInputType.numberWithOptions(),
                            controller: birthController,
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
                                birthController.text = formattedDate;
                                print(birthController.text.toString());
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
                    Container(
                      height: 55.0,
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(249, 192, 209, 1),
                              Color.fromRGBO(250, 250, 250, 1.0)
                            ]),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${HomeCubit.get(context).profileModel!.data!.first.age}',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // Change Password ...
                Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(
                            0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    focusColor: thirdColor,
                    onPressed: () {
                      final AlertDialog alert = AlertDialog(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        title: const Text("تغيير كلمة المرور"),
                        titleTextStyle: const TextStyle(
                            color: Color.fromRGBO(239, 92, 147, 1),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                        content: SizedBox(
                          height: 350,
                          child: Form(
                            key: formKey2,
                            child: Column(
                              children: [
                                const Divider(
                                  color:
                                  Color.fromRGBO(239, 92, 147, 1),
                                  thickness: 1.0,
                                  height: 20.0,
                                ),
                                defaultFormField(
                                  controller: oldPasswordController,
                                  keyboardType: TextInputType.text,
                                  hintText: "ادخل الرقم السرى القديم ",
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
                                  // suffix: ProfileCubit.get(context).suffix,
                                  // obscureText: ProfileCubit.get(context).isPassword,
                                  // suffixPressed: (){
                                  //   ProfileCubit.get(context).changePasswordVisibilityy();
                                  // }
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultFormField(
                                  controller: newPasswordController,
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
                                  // suffix: ProfileCubit.get(context).suffix,
                                  // obscureText: ProfileCubit.get(context).isPassword,
                                  // suffixPressed: (){
                                  //   ProfileCubit.get(context).changePasswordVisibilityy();
                                  // }
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultFormField(
                                  controller: confirmPasswordController,
                                  keyboardType: TextInputType.text,
                                  hintText:
                                  "إعادة ادخال الرقم السرى الجديد ",
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
                                  //suffix: ProfileCubit.get(context).suffix,
                                  //obscureText: ProfileCubit.get(context).isPassword,
                                  // suffixPressed: (){
                                  //   ProfileCubit.get(context).changePasswordVisibilityy();
                                  // }
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: ()
                                  {
                                    HomeCubit.get(context).changePassword(
                                        oldpassword: oldPasswordController.text,
                                        new_password: newPasswordController.text,
                                        new_password_conf: confirmPasswordController.text);
                                    oldPasswordController.clear();
                                    newPasswordController.clear();
                                    confirmPasswordController.clear();
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      border: Border.all(
                                          color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                    ),
                                    child: const Text(
                                      'تعديل',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => alert,
                      );
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        Text(
                          "تغيير الرقم السرى",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                GestureDetector(
                  onTap: () {
                    if(formKey1.currentState!.validate())
                    {
                      HomeCubit.get(context).updateProfile(
                        email: emailController.text,
                        phone: phoneController.text,
                        first_name: nameController.text,
                        birthdate: birthController.text,
                        last_name: nameController2.text,
                      );
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(color: Colors.white),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: const Text(
                      'تعديل',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

}