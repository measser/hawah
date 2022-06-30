import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/search/cubit/search_cubit.dart';
import 'package:hawwah/modules/search/repository/maps_repo.dart';
import 'package:hawwah/modules/search/search_doctor.dart';
import 'package:hawwah/modules/search/search_lab.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/network/remote/search_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(236, 156, 184, 90.0),
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomeLayout()));
          },
        ),
        title: const Text(
          'البحث',
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 204,
                          width: 312,
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: HexColor('FAACC3'),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: IconButton(
                                        icon: Image.asset(
                                          'assets/icons/search_laboratory.png',
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                        onPressed: () {
                                          navigateToAndFinish(
                                            context,
                                            BlocProvider(
                                              create: (context) => SearchCubit(MapsRepo(SearchHelper())),
                                              child: const SearchLab(),
                                            ),
                                          );
                                        }),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: IconButton(
                                        icon: Image.asset(
                                          'assets/icons/search_doctor.png',
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                        onPressed: ()  {
                                          navigateToAndFinish(
                                            context,
                                            BlocProvider(
                                              create: (context) => SearchCubit(MapsRepo(SearchHelper())),
                                              child: const SearchDoctor(),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

