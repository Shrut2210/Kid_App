import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kid_app/AForApple.dart';
import 'package:kid_app/CountTheRound.dart';
import 'package:kid_app/FillTheNumber.dart';
import 'package:kid_app/FindTheAnimal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    body: SafeArea(
      top: true,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset('assets/images/home.jpg', fit: BoxFit.cover,),

          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child:
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*1/4,
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.only(top: 90, left: 60),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text('Count The \nRound', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20,),)),
                        ),
                        onTap: () {
                          // playAudioFromUrl("https://filesamples.com/samples/audio/mp3/Symphony%20No.6%20(1st%20movement).mp3");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return CountTheRound();
                          }));
                          final assetsAudioPlayer = AssetsAudioPlayer();

                          assetsAudioPlayer.open(
                            Audio("assets/audio/temp3.mp3"),
                          );

                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*1/4,
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 60, bottom: 30, right: 100),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text('A For \nApple', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),)),
                        ),
                        onTap: () {
                          final assetsAudioPlayer = AssetsAudioPlayer();

                          assetsAudioPlayer.open(
                            Audio("assets/audio/temp3.mp3"),
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return AForApple();
                          }));

                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*1/5,
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 35, left: 140),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text('Find The \nAnimal', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),)),
                        ),
                        onTap: () {
                          final assetsAudioPlayer = AssetsAudioPlayer();

                          assetsAudioPlayer.open(
                            Audio("assets/audio/temp3.mp3"),
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return FindTheAnimal();
                          }));
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*1/5,
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 45,top: 10, right: 120),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text('Fill The \nNumber', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),)),
                        ),
                        onTap: () {
                          final assetsAudioPlayer = AssetsAudioPlayer();

                          assetsAudioPlayer.open(
                            Audio("assets/audio/temp3.mp3"),
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return FillTheNumber();
                          }));
                        },
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height*1/5,
                    //   child: InkWell(
                    //     child: Container(
                    //       margin: EdgeInsets.only( bottom: 80, left: 160),
                    //       height: 100,
                    //       width: 150,
                    //       decoration: BoxDecoration(
                    //           color: Colors.deepPurpleAccent,
                    //           borderRadius: BorderRadius.circular(30)
                    //       ),
                    //       child: Center(child: Text('Bird Game', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),)),
                    //     ),
                    //     onTap: () {
                    //       // final assetsAudioPlayer = AssetsAudioPlayer();
                    //       //
                    //       // assetsAudioPlayer.open(
                    //       //   Audio("assets/audio/temp2.mp3"),
                    //       // );
                    //       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    //         return MemoryGame();
                    //       }));
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
    throw UnimplementedError();
  }
}
