
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  _DetailpageState createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
        children: [

         Positioned(
           left: 0,
             right: 0,
             child: Container(
               width: double.maxFinite,
               height: 300,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("img/mountain.jpeg"),
                   fit: BoxFit.cover
                 ),


               ),


         )),
          Positioned(
              left : 20,
              top: 70,
              child: Row(

                children: [
                  IconButton(onPressed: (){},icon : Icon(Icons.menu, color: Colors.white,))
                ],
              ))
        ],
        ),
      ),
    );
  }
}
