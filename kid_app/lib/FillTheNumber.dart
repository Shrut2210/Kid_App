import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'SuccessPage.dart';

class FillTheNumber extends StatefulWidget {  @override
  State<FillTheNumber> createState() => _FillTheNumberState();
}

class _FillTheNumberState extends State<FillTheNumber> {
  @override
Widget build(BuildContext context) {
  List<int> num = [];
  Random random = Random();
  bool _isDropped = false;
  String? ansData;

  var temp = random.nextInt(9);
  while (temp <= 1){
    temp = random.nextInt(9);
  }

  while (num.length < 10) {
    int randomNumber = random.nextInt(10) + 1;
    if (!num.contains(randomNumber)) {
      num.add(randomNumber);
    }
  }

  return Scaffold(
    body: SafeArea(
      top: true,
      bottom: true,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset('assets/images/forth.jpg', fit: BoxFit.cover,),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(),
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text(temp.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
                        ),
                        DragTarget(builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {

                          return ClipRRect(
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: ansData.toString() == (temp+1%10).toString() ? Colors.blue : Colors.transparent,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Text(ansData.toString() == (temp+1%10).toString() ? (temp+1%10).toString() : '' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
                            ),
                          );
                        },
                        onAccept: (data) {
                          final assetsAudioPlayer = AssetsAudioPlayer();

                          assetsAudioPlayer.open(
                            Audio("assets/audio/temp3.mp3"),
                          );

                          Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                            return SuccessPage();
                          }));
                          setState(() {

                          });
                        },
                        onWillAccept: (data) {
                          ansData = data.toString();
                          print(data);


                          return data == ((temp+1)%10).toString();
                        },),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text((temp+2).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                        itemBuilder: (itemBuilder, index) {
                        return Container(
                          height: 50,
                          width: 70,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          child: LongPressDraggable<String>(
                                data: (num[index]).toString(),
                                child: Container(
                                  width: 80,
                                  height: 60,
                                  child: Center(child: Text(num[index].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                feedback: Material(
                                  child: Container(
                                    width: 80,
                                    height: 60,
                                    child: Center(child: Text(num[index].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),),
                                    decoration: BoxDecoration(
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ),
                                childWhenDragging: Container(),
                              ),
                        );
                        }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  // TODO: implement build
  throw UnimplementedError();
}}
