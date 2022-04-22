import 'package:flutter/material.dart';

class KeyBoardKeys extends StatelessWidget {
  const KeyBoardKeys({
    required this.text,
    required this.onTap,
    Key? key,}) : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFD1D5DB),
              spreadRadius: 2,
              offset: Offset(0,0),
            ),
          ]
        ),
        margin: EdgeInsets.all(4),
        width: 30,
        height: 45,
        //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
