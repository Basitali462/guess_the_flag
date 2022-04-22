import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_guess_app/constants/controller_holder.dart';

import '../models/flag_model.dart';

class HintPage extends StatelessWidget {
  const HintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              countryList[activeFlagController.activeFlagIndex.value].countyFlagImg,
            ),
            SizedBox(height: 20,),
            Text(
              countryList[activeFlagController.activeFlagIndex.value].countryFlagName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            /*Text(
              countryList[activeFlagController.activeFlagIndex.value].isoCode,
            ),
            Text(
              countryList[activeFlagController.activeFlagIndex.value].countryCode,
            ),*/
          ],
        ),
      ),
    );
  }
}
