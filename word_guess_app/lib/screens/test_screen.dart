import 'package:flutter/material.dart';
import 'package:word_guess_app/models/flag_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (context, index){
        return Column(
          children: [
            Image.asset(
              countryList[index].countyFlagImg,
              width: 50,
              height: 50,
            ),
            Text(
              countryList[index].countryFlagName,
            ),
            Text(
              countryList[index].isoCode,
            ),
            Text(
              countryList[index].countryCode,
            ),
            Divider(
              height: 10,
              color: Colors.black45,
            ),
          ],
        );
      },),
    );
  }
}
