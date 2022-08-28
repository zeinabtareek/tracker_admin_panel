import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/constant.dart';


class CustomContainer extends StatelessWidget {
    CustomContainer(  {Key? key ,required this.index ,required this.numberOfUsers}) : super(key: key);
int index;
int numberOfUsers;
  @override
  Widget build(BuildContext context) {
    return    Expanded(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Color(0xFFE7E7E7),
          child: Card(
            color: Color(0xFFE7E7E7),
            child: Container(
              color: K.colors[index],
              width: 250,
              height: 140,
              padding: const EdgeInsets.all(20),
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children:   [
                      Expanded(
                          child: Text(
                            '$numberOfUsers',
                            style: TextStyle(fontSize: 14),
                          )),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  Text(dashBoardTitles[index].toString())
                ],
              ),
            ),
          ),
        ),
      );
    }
    List dashBoardTitles=[
      'Number Of Active Users'.tr,
      'Number Of anonymous Users'.tr,
      'Number Of shipments'.tr
    ];
  }

