import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/colors.dart';

class RiskResultScreen extends StatefulWidget {
  final result1;
  final result2;
  final result3;
  final result4;

  const RiskResultScreen({
    Key? key,
    required this.result1,
    required this.result2,
    required this.result3,
    required this.result4,
  }) : super(key: key);

  @override
  State<RiskResultScreen> createState() => _RiskResultScreenState();
}

class _RiskResultScreenState extends State<RiskResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نســبة الإصابة", style: TextStyle(color: Colors.white)),
        backgroundColor:  Color(-471589),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              )),
        ),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(-471589),
                Color.fromRGBO(250, 250, 250, 1.0)
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'النسبة الخاصة بك بالنسبة المئويه',
              style: TextStyle(
                  color: thirdColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: thirdColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ' نسبه الاصابه الخاصه بك علي مدار خمس اعوام : ',
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width *.6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.result1 * 100} %',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'نسبه الاصابه لمن يشبهك علي مدار ٥ اعوام : ',
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width *.6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.result2 * 100} %',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'نسبه الاصابه لمن يشبهك مدي الحياه : ',
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width *.6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.result3 * 100} %',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'نسبه الاصابه الخاصه بك علي مدار الحياه : ',
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width *.6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.result4 * 100} %',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
