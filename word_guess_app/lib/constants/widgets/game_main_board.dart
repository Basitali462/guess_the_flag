import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../models/flag_model.dart';
import '../controller_holder.dart';
import 'guess_board_widgets/guess_grid.dart';

class GameMainBoard extends StatelessWidget {
  const GameMainBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 250),
      child: SingleChildScrollView(
        child: Obx(() => Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*GestureDetector(
                onTap: (){
                  activeFlagController.moveLeft();
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                ),
              ),*/
              Expanded(
                //flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => Container(
                      child: Image.asset(
                        countryList[activeFlagController.activeFlagIndex.value].countyFlagImg,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              spreadRadius: 2,
                            ),
                          ]
                      ),
                    ),),
                    SizedBox(height: 20,),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: List.generate(
                        activeFlagController.currentActiveFlagWordCount(),
                            (index) {
                          return GuessGrid(
                            index: index,
                          );
                        },),
                    ),
                  ],
                ),
              ),
              /*GestureDetector(
                onTap: (){
                  activeFlagController.moveRight();
                },
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
              ),*/
            ],
          ),
        ),),
      ),
    );
  }
}
