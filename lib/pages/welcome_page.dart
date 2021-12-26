


import 'package:cubit_application/widgets/app_large_text.dart';
import 'package:cubit_application/widgets/app_text.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( //we will use body and other propreties so we use Scaffold instead of Container !
       body: PageView.builder(
           scrollDirection: Axis.vertical,
           itemCount: images.length,
           itemBuilder:(_,index){ // this is the default context "_" and an index for telling where we are

             return Container(
               width: double.maxFinite,
               height: double.maxFinite,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage(
                     "img/"+images[index]
                   ),
                   fit: BoxFit.cover // to cover the whole screen of the phone
                 )
               ),

               child: Container( // the benefit is that we can specify the margins
                 margin: const EdgeInsets.only(top: 150,left: 20, right: 20),
                 child: Row(
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start, // pour que Trips et Mountain commence au même niveau
                       children: [
                         AppLargeText(text: "Trips"),
                         AppText(text: "Mountain", size: 30),
                         Container(
                           child: AppText(text: "Mountain", size: 30), ,
                         )
                       ],
                     )
                   ],
                 ),

               ),
             );
       }),
    );
  }
}
