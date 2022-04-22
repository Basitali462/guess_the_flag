import 'package:flutter/material.dart';
import 'package:word_guess_app/constants/controller_holder.dart';

class KeyBoardEnterKey extends StatelessWidget {
  const KeyBoardEnterKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        activeFlagController.onEnterPress();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFFDEDEDE),
        ),
        margin: EdgeInsets.all(4),
        width: 60,
        height: 45,
        //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: Text(
            'ENTER',
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
