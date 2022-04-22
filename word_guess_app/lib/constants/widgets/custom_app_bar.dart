import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:word_guess_app/constants/controller_holder.dart';
import 'package:word_guess_app/constants/widgets/hint_button.dart';
import 'package:word_guess_app/screens/hint_page.dart';
import 'package:word_guess_app/screens/test_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeData().scaffoldBackgroundColor,
      elevation: 0,
      actions: const [
        HintButton(),
        SizedBox(width: 20,),
      ],
    );
  }
}
