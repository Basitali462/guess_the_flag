import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_guess_app/constants/controller_holder.dart';

class GuessGrid extends StatelessWidget {
  const GuessGrid({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD1D5DB),
            spreadRadius: 2,
            offset: Offset(0,0),
          ),
        ],
      ),
      child: Obx(() => Text(
        activeFlagController.activeFlagWordList.length > index
            ? activeFlagController.activeFlagWordList[index].toUpperCase()
            : ''.toUpperCase(),
        //''.toUpperCase(),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),),
    );
  }
}
