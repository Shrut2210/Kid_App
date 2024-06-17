import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
  
  return Scaffold(
    body: SafeArea(
      child: Expanded(
        child: Stack(
          children: [
            Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              image: DecorationImage(image: AssetImage('assets/gif/1.gif'), fit: BoxFit.contain)
            ),
          ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/gif/10.gif'), fit: BoxFit.cover)
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                  child: Icon(Icons.arrow_back, size: 25, )
              ),
              onTap: ()
              {
                Navigator.pop(context);
              },
            )
          ]
        ),
      ),
    ),
  );
    // TODO: implement build
    throw UnimplementedError();
  }
}
