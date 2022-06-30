import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/shared/components/colors.dart';

class PredictionResultScreen extends StatefulWidget {
  String text;
  PredictionResultScreen({Key? key,required this.text}) : super(key: key);

  @override
  _PredictionResultScreenState createState() => _PredictionResultScreenState();
}

class _PredictionResultScreenState extends State<PredictionResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
              title: Text(
                'التحليل',
                style: TextStyle(
                    fontSize: 40,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              leading: InkWell(
                onTap: Navigator.of(context).pop,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: secondaryColor,
                ),
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
              child: Center(
                child: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/cloud.png'),
                            fit: BoxFit.fill)),
                    child: Center(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(206, 86, 139, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ));
      },
    );
  }

  Widget _appBar() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 60,
      color: Color.fromRGBO(253, 220, 230, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'حَوَّاء ',
            style:
            TextStyle(fontSize: 35, color: Color.fromRGBO(206, 86, 139, 1)),
          ),
        ],
      ),
    );
  }

  _background() {
    return Container(
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
    );
  }
}
