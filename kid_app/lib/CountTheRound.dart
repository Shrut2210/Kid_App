import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:kid_app/SuccessPage.dart';

class CountTheRound extends StatefulWidget {  @override
  State<CountTheRound> createState() => _CountTheRoundState();
}

class _CountTheRoundState extends State<CountTheRound> {
  @override
  Widget build(BuildContext context) {
  List<int> num = [];
  Random random = Random();
  int count = 0;

  // Generate random numbers without repetition
  while (num.length < 10) {
    int randomNumber = random.nextInt(10) + 1;
    if (!num.contains(randomNumber)) {
      num.add(randomNumber);
    }
  }
  print(num);


  List<Map<String, dynamic>> dataImg = [{'num' : 4, 'ans' : 2, 'imgleft': 'assets/images/'+ num[4].toString() + '.png', 'imgright': 'assets/images/'+ num[2].toString()+'1.png'},
    {'num' : 5, 'ans' : 9, 'imgleft': 'assets/images/'+ num[5].toString() + '.png', 'imgright': 'assets/images/'+ num[9].toString()+'1.png'},
    {'num' : 6, 'ans' : 1, 'imgleft': 'assets/images/'+ num[6].toString() + '.png', 'imgright': 'assets/images/'+ num[1].toString()+'1.png'},
    {'num' : 7, 'ans' : 4, 'imgleft': 'assets/images/'+ num[7].toString() + '.png', 'imgright': 'assets/images/'+ num[4].toString()+'1.png'},
    {'num' : 8, 'ans' : 7, 'imgleft': 'assets/images/'+ num[8].toString() + '.png', 'imgright': 'assets/images/'+ num[7].toString()+'1.png'},
    {'num' : 9, 'ans' : 0, 'imgleft': 'assets/images/'+ num[9].toString() + '.png', 'imgright': 'assets/images/'+ num[0].toString()+'1.png'},
    {'num' : 0, 'ans' : 3, 'imgleft': 'assets/images/'+ num[0].toString() + '.png', 'imgright': 'assets/images/'+ num[3].toString()+'1.png'},
    {'num' : 1, 'ans' : 5, 'imgleft': 'assets/images/'+ num[1].toString() + '.png', 'imgright': 'assets/images/'+ num[5].toString()+'1.png'},
    {'num' : 2, 'ans' : 8, 'imgleft': 'assets/images/'+ num[2].toString() + '.png', 'imgright': 'assets/images/'+ num[8].toString()+'1.png'},
    {'num' : 3, 'ans' : 6, 'imgleft': 'assets/images/'+ num[3].toString() + '.png', 'imgright': 'assets/images/'+ num[6].toString()+'1.png'}];
  return Scaffold(
    body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset('assets/images/first.jpg', fit: BoxFit.cover,),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 150),
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
                      data: dataImg[index]['num'].toString(),
                      child: Container(
                        width:  55,
                        height:  45,
                        margin: EdgeInsets.only(right: 40,bottom: 10),
                        alignment: Alignment.center,
                        child: Text((num[(index+4)%10]).toString(), style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(num[index]*80, num[index]*40, num[index]*20, 1))
                      ),
                      feedback: Material(
                        child: Container(
                            width:  55,
                            height:  45,
                            // margin: EdgeInsets.only(right: 40,bottom: 10),
                            alignment: Alignment.center,
                            child: Text((num[(index+4)%10]).toString(), style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Colors.white),),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(num[index]*80, num[index]*40, num[index]*20, 1))
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
                          width: 80,
                          height: 50,
                          margin: EdgeInsets.only(left: 50, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage(dataImg[index]['imgright'],), fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                    onAccept: (data) {
                    },
                      onWillAccept: (data) {
                      if(data == (dataImg[index]['ans']).toString()) {

                        final assetsAudioPlayer = AssetsAudioPlayer();

                        assetsAudioPlayer.open(
                          Audio('assets/audio/temp3.mp3'),
                        );

                        count++;
                        dataImg[index]['imgright'] = '';
                        dataImg[index]['num'] = -1;
                        dataImg[index]['ans'] = -1;
                      }
                      else
                        {

                        }

                      if(count == 10) {

                      Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                        return SuccessPage();
                      }));
                      setState(() {

                      });
                      }
                      return data == dataImg[index]['ans'].toString();
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
