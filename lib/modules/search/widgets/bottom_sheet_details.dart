import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/colors.dart';

Widget buildDoctorMarkerDetails({
  required String doctorName,
  required String doctorNumber,
  required String doctorAddress,
   String? doctorServices1,
   String? doctorServices2,
}){
  return Container(
    child: ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children:  <Widget>[
        Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: thirdColor,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'اسم الدكتور :',
                      style: TextStyle(
                        color: thirdColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:  Text(
                      doctorName,
                      style: TextStyle(
                        fontSize: 16,

                      ),
                    ),
                    leading: const Image(
                      image: AssetImage('assets/icons/search_doctor.png'),
                      height: 50.0,
                      width: 50.0,
                    ),

                  ),
                ),
              ),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
                color: thirdColor,
                thickness: 1,
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            'رقم الهاتف :',
            style: TextStyle(
              color: thirdColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle:  Text(
            doctorNumber,
            style: TextStyle(
              fontSize: 18,

            ),
          ),
          leading:  Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(
                color: thirdColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.phone,
              color: thirdColor,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'العنوان :',
            style: TextStyle(
              color: thirdColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            doctorAddress,
            style: TextStyle(
              fontSize: 18,

            ),
          ),
          leading:  Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(
                color: thirdColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.location_on,
              color: thirdColor,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'الخدمـات:',
            style: TextStyle(
              color: thirdColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
               doctorServices1!,
                style: TextStyle(
                  fontSize: 18,

                ),
              ),
              Text(
                doctorServices2!,
                style: TextStyle(
                  fontSize: 18,

                ),

              ),
            ],
          ),
          leading:  Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(
                color: thirdColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.toc_sharp,
              color: thirdColor,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'التقييم :',
            style: TextStyle(
              color: thirdColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              Text(
                '(5.0)',
                style: TextStyle(
                  fontSize: 18,
                  color: thirdColor,
                ),
              ),
            ],
          ),
          leading:  Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(
                color: thirdColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.star,
              color: thirdColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),


      ],
    ),
  );
}