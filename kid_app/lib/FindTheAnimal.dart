import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'SuccessPage.dart';

class FindTheAnimal extends StatefulWidget {  @override
  State<FindTheAnimal> createState() => _FindTheAnimalState();
}

class _FindTheAnimalState extends State<FindTheAnimal> {
  @override
Widget build(BuildContext context) {

  int count = 0;
  bool isDrop = false;
  List<Map<String, dynamic>> dataImg = [
    {'num' : 1, 'ans' : 3, 'name' : 'Bear', 'img': 'assets/images/fox.png'},
    {'num' : 2, 'ans' : 6, 'name' : 'Camel', 'img': 'assets/images/rabbit.png'},
    {'num' : 3, 'ans' : 9, 'name' : 'Deer', 'img': 'assets/images/bear.png'},
    {'num' : 4, 'ans' : 8, 'name' : 'Elephent', 'img': 'assets/images/monkey.png'},
    {'num' : 5, 'ans' : 1, 'name' : 'Fox', 'img': 'assets/images/zebra.png'},
    {'num' : 6, 'ans' : 10, 'name' : 'Giraffe', 'img': 'assets/images/camel.png'},
    {'num' : 7, 'ans' : 12, 'name' : 'Horse', 'img': 'assets/images/tiger.png'},
    {'num' : 8, 'ans' : 11, 'name' : 'Lion', 'img': 'assets/images/Elephent.png'},
    {'num' : 9, 'ans' : 4, 'name' : 'Monkey', 'img': 'assets/images/deer.png'},
    {'num' : 10, 'ans' : 2, 'name' : 'Rabbit', 'img': 'assets/images/giraffe.png'},
    {'num' : 11, 'ans' :7, 'name' : 'Tiger', 'img': 'assets/images/Lion.png'},
    {'num' : 12, 'ans' : 5, 'name' : 'Zebra', 'img': 'assets/images/horse.png'},
  ];
  return Scaffold(
    body: SafeArea(
      top: true,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset('assets/images/third.jpg', fit: BoxFit.cover,),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 160),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, var index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Draggable<String>(
                          data: (dataImg[index]['ans']).toString(),
                          child: Container(
                            width: 80,
                            height: 40,
                            margin: EdgeInsets.only(right: 50),
                            alignment: Alignment.center,
                            child: Text(dataImg[index]['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          feedback: Material(
                            child: Container(
                              width: 80,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(dataImg[index]['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 50),
                          )
                        ),
                        DragTarget(builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rehected) {
                          return ClipRRect(
                            child: Container(
                              width: 60,
                              margin: EdgeInsets.only(left: 30),
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(dataImg[index]['img'],), fit: BoxFit.contain),
                              ),
                            ),
                          );
                        },
                          onAccept: (data) {
                          },
                          onWillAccept: (data) {

                          print(data);
                          print((dataImg[index]['num']));

                            if(data == (dataImg[index]['num']).toString()) {

                              final assetsAudioPlayer = AssetsAudioPlayer();

                              assetsAudioPlayer.open(
                                Audio('assets/audio/temp3.mp3'),
                              );

                              dataImg[index]['img'] = '';
                              dataImg[index]['num'] = -1;
                              dataImg[index]['ans'] = -1;
                              count++;
                            }
                            if(count == 12) {
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
