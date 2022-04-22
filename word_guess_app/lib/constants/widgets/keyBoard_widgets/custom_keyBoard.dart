import 'package:flutter/material.dart';
import 'package:word_guess_app/constants/controller_holder.dart';
import 'package:word_guess_app/constants/widgets/keyBoard_widgets/keyBoard_enter_key.dart';
import 'package:word_guess_app/constants/widgets/keyBoard_widgets/keyBoard_remove_key.dart';
import 'package:word_guess_app/constants/widgets/keyBoard_widgets/keyboard_keys.dart';

class CustomKeyBoard extends StatelessWidget {
  const CustomKeyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = [
      'q','w','e','r','t','y','u','i','o','p',
    ];
    List<String> secondRow = [
      'a','s','d','f','g','h','j','k','l',
    ];
    List<String> thirdRow = [
      'z','x','c','v','b','n','m',
    ];
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...firstRow.map(
              (letter) => Expanded(
                child: KeyBoardKeys(
                  text: letter.toUpperCase(),
                  onTap: () {
                    activeFlagController.onLetterKeyPress(letter);
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            ...secondRow.map(
                  (letter) => Expanded(
                    flex: 2,
                    child: KeyBoardKeys(
                text: letter.toUpperCase(),
                onTap: () {
                  activeFlagController.onLetterKeyPress(letter);
                },
              ),
                  ),
            ),
            Spacer(flex: 1,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: KeyBoardEnterKey(),),
            ...thirdRow.map(
                  (letter) => Expanded(
                    flex: 1,
                    child: KeyBoardKeys(
                text: letter.toUpperCase(),
                onTap: () {
                  activeFlagController.onLetterKeyPress(letter);
                },
              ),
                  ),
            ),
            Expanded(
              flex: 2,
              child: KeyBoardRemoveKey(),
            ),
          ],
        ),
      ],
    );
  }
}
