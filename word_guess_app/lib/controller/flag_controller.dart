import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_guess_app/models/flag_model.dart';

class FlagController extends GetxController{
  var activeFlagIndex = 0.obs;
  var currentGuessIndex = 0.obs;

  List activeFlagWordList = [].obs;
  String currentActiveWord = '';

  /*void moveLeft(){
    resetValues();
    currentActiveFlagWordCount();
    *//*if(activeFlagIndex.value > 0){
      //activeFlagIndex--;
      resetValues();
      currentActiveFlagWordCount();
    }*//*
  }*/
  /*void moveRight(){
    //activeFlagIndex++;
    resetValues();
    currentActiveFlagWordCount();
  }*/

  int currentActiveFlagWordCount(){
    //getRandomFlagNumber();
    currentActiveWord = countryList[activeFlagIndex.value].countryFlagName.replaceAll(' ', '');
    //activeFlagWordList.length = word.length;
    return currentActiveWord.length;
  }

  void getRandomFlagNumber(){
    Random rnd = Random();
    activeFlagIndex.value = rnd.nextInt(countryList.length);
    print("Curr active flag" + activeFlagIndex.value.toString());
  }

  void onLetterKeyPress(String val){
    if(currentGuessIndex < currentActiveWord.length){
      print('cur length' + currentGuessIndex.value.toString());
      print('active word len : ' + currentActiveWord.length.toString());
      activeFlagWordList.insert(currentGuessIndex.value, val,);
      currentGuessIndex++;
    }
  }

  void onPressBackSpace(){
    if(activeFlagWordList.isNotEmpty){
      print('cur length' + currentGuessIndex.value.toString());
      currentGuessIndex--;
      activeFlagWordList.removeAt(currentGuessIndex.value);
    }
  }

  void resetValues(){
    currentGuessIndex.value = 0;
    activeFlagWordList.clear();
  }

  void onEnterPress(){
    if(activeFlagWordList.length != currentActiveWord.length){
      Get.snackbar('Incomplete Word', 'Please Fill all the spaces');
    } else if(activeFlagWordList.length == currentActiveWord.length){
      String matchWord = activeFlagWordList.join('');
      if(matchWord.toLowerCase() == currentActiveWord.toLowerCase()){
        //Get.snackbar('Congratulations', 'You Guess the Flag');
        Get.defaultDialog(
          title: 'HURRAY..!!! \n YOU GOT IT RIGHT',
          titleStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'roboto'
          ),
          content: Image.asset(
            'assets/images/party-popper.png',
            width: 80,
            height: 80,
          ),
          //textConfirm: 'Try Again',
          confirm: GestureDetector(
            onTap: (){
              print('Pressing conform');
              resetValues();
              getRandomFlagNumber();
              //currentActiveFlagWordCount();
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.lightGreen,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ]
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          barrierDismissible: false,
        );
      }else{
        Get.defaultDialog(
          title: 'Wrong Guess',
          content: Icon(
            Icons.highlight_remove,
            color: Colors.red,
            size: 40,
          ),
          //textConfirm: 'Try Again',
          confirm: GestureDetector(
            onTap: (){
              print('Pressing conform');
              resetValues();
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.red,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ]
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          barrierDismissible: false,
        );
      }
    }
  }
}