import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/shared/components/colors.dart';

import '../../layout/cubit/home_cubit.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool sel = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(249, 157, 185, 1.0),
                      Color.fromRGBO(253, 220, 230, 1.0)
                    ]),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                          ),
                          iconSize: 40,
                        ),
                        const Text(
                          'التقرير',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 35),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 42,
                          ),
                          Container(
                            height: 40,
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
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Image.asset(
                                    'assets/icons/magnifier.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/download.png',
                                  color: Color.fromRGBO(206, 86, 139, 1),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/icons/printer.png'),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    sel = !sel;
                                    print(sel);
                                  });
                                },
                                child: const Text(
                                  ' تحديد ',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Color.fromRGBO(206, 86, 139, 1)),
                                ),
                              )
                            ],
                          ),
                          HomeCubit.get(context).reportModel != null
                              ? Expanded(
                                  child: ListView.separated(
                                    itemCount: HomeCubit.get(context).reportModel!.questions!.length,
                                    itemBuilder: (context, index) {
                                      return ItemReport(
                                        isSelected: sel,
                                        date: HomeCubit.get(context).reportModel!.questions![index].date,
                                        answer: HomeCubit.get(context).reportModel!.questions![index].selfCheck!.question,
                                        Q: HomeCubit.get(context).reportModel!.questions![index].answer,
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 25,
                                      );
                                    },
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                  'لا يوجد بيانات',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}

class ItemReport extends StatefulWidget {
  bool? isSelected;
  String? date;
  String? answer;
  bool? Q;

  ItemReport({
    Key? key,
    required this.isSelected,
    required this.date,
    required this.answer,
    required this.Q,
  }) : super(key: key);

  @override
  _ItemReportState createState() => _ItemReportState();
}

class _ItemReportState extends State<ItemReport> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color.fromRGBO(206, 86, 139, 1);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSelected!
        ? Row(
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: const Color.fromRGBO(253, 220, 230, 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ExpansionTile(
                    collapsedIconColor: const Color.fromRGBO(206, 86, 139, 1),
                    iconColor: const Color.fromRGBO(206, 86, 139, 1),
                    collapsedBackgroundColor:
                        const Color.fromRGBO(249, 237, 241, 1),
                    backgroundColor: const Color.fromRGBO(249, 237, 241, 1),
                    title: Text(
                      '${widget.date}',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    children: [
                      Text(
                        '${widget.answer}',
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          widget.Q!
                              ? Text(
                                  'نعم',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                )
                              : Text(
                                  'لا',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          )
        : Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: const Color.fromRGBO(253, 220, 230, 1.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ExpansionTile(
              collapsedIconColor: const Color.fromRGBO(206, 86, 139, 1),
              iconColor: const Color.fromRGBO(206, 86, 139, 1),
              collapsedBackgroundColor: const Color.fromRGBO(249, 237, 241, 1),
              backgroundColor: const Color.fromRGBO(249, 237, 241, 1),
              title: Text(
                '${widget.date}',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              children: [
                Text(
                  '${widget.answer}',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.Q!
                        ? Text(
                            'نعم',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          )
                        : Text(
                            'لا',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
  }
}
