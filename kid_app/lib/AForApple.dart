import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'SuccessPage.dart';

class AForApple extends StatefulWidget {  @override
  State<AForApple> createState() => _AForAppleState();
}

class _AForAppleState extends State<AForApple> {
  @override
Widget build(BuildContext context) {
  List<int> num = [];
  Random random = Random();
  int count = 0;

  // Generate random numbers without repetition
  while (num.length < 26) {
    int randomNumber = random.nextInt(26) + 65;
    if (!num.contains(randomNumber)) {
      num.add(randomNumber);
    }
  }

  List<Map<String, dynamic>> dataImg = [{'num' : num[8],'ans' : num[4], 'imgleft': 'assets/images/'+ String.fromCharCode(num[4]) + '.png', 'imgright': 'assets/images/'+String.fromCharCode(num[8]) +'1.png'},
    {'num' : num[10],'ans' : num[5], 'imgleft': 'assets/images/'+ String.fromCharCode(num[5]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[10])+'1.png'},
    {'num' : num[7],'ans' : num[6], 'imgleft': 'assets/images/'+ String.fromCharCode(num[6]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[7])+'1.png'},
    {'num' : num[9],'ans' : num[7], 'imgleft': 'assets/images/'+ String.fromCharCode(num[7]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[9])+'1.png'},
    {'num' : num[4],'ans' : num[8], 'imgleft': 'assets/images/'+ String.fromCharCode(num[8]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[4])+'1.png'},
    {'num' : num[13],'ans' : num[9], 'imgleft': 'assets/images/'+ String.fromCharCode(num[9]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[13])+'1.png'},
    {'num' : num[11],'ans' : num[10], 'imgleft': 'assets/images/'+ String.fromCharCode(num[10]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[11])+'1.png'},
    {'num' : num[6],'ans' : num[11], 'imgleft': 'assets/images/'+ String.fromCharCode(num[11]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[6])+'1.png'},
    {'num' : num[5],'ans' : num[12], 'imgleft': 'assets/images/'+ String.fromCharCode(num[12]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[5])+'1.png'},
    {'num' : num[12],'ans' : num[13], 'imgleft': 'assets/images/'+ String.fromCharCode(num[13]) + '.png', 'imgright': 'assets/images/'+ String.fromCharCode(num[12])+'1.png'},
  ];

  return Scaffold(
    body: SafeArea(
      top: true,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset('assets/images/second.jpg', fit: BoxFit.cover,),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 120),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, var index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Draggable<String>(
                          data: (dataImg[index]['ans']-65).toString(),
                          child: Container(
                            width:  50,
                            height:  47,
                            margin: EdgeInsets.only(right: 50),
                            alignment: Alignment.center,
                            child: Text(String.fromCharCode(num[(index+4)]), style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white)),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(num[index]*90, num[index]*60, num[index]*30, 1),
                              borderRadius: BorderRadius.circular(15)
                              // image: DecorationImage(image: AssetImage(dataImg[index]['imgleft'],), fit: BoxFit.cover),
                            ),
                          ),
                          feedback: Material(
                            child: Container(
                              width:  50,
                              height:  47,
                              // margin: EdgeInsets.only(right: 50),
                              alignment: Alignment.center,
                              child: Text(String.fromCharCode(num[(index+4)]), style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white)),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(num[index]*90, num[index]*60, num[index]*30, 1),
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            width: 50,
                            height: 55,
                            margin: EdgeInsets.only(right: 50),
                            color: Colors.transparent,
                          ),
                        ),
                        DragTarget(builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rehected) {
                          return ClipRRect(
                            child: Container(
                              width: 55,
                              height: 55,
                              margin: EdgeInsets.only(left: 50, bottom: 4),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(dataImg[index]['imgright'],), fit: BoxFit.cover),
                              ),
                            ),
                          );
                        },
                          onAccept: (data) {
                          },
                          onWillAccept: (data) {
                            if(data == ((dataImg[index]['num']-65)).toString()) {

                              final assetsAudioPlayer = AssetsAudioPlayer();

                              assetsAudioPlayer.open(
                                Audio('assets/audio/temp3.mp3'),
                              );

                              count++;
                              dataImg[index]['imgright'] = '';
                              dataImg[index]['num'] = -1;
                              dataImg[index]['ans'] = -1;
                            }
                            if(count == 10) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                                return SuccessPage();
                              }));
                              setState(() {

                              });
                            }
                            return data == dataImg[index]['num'].toString();
                          },
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    ),
  );
  // TODO: implement build
  throw UnimplementedError();
}}
