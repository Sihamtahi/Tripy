


import 'package:cubit_application/cubit/app_cubit_state.dart';
import 'package:cubit_application/misc/colors.dart';
import 'package:cubit_application/widgets/app_large_text.dart';
import 'package:cubit_application/widgets/app_text.dart';
import 'package:cubit_application/widgets/responsive_botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // if we want to use many text with the index for each page of the slider ! go ahead
  List Texts = [
    "Mountain hikes gives you an incredible sens of freedom along with endurance test "

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
                   mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start, // pour que Trips et Mountain commence au même niveau
                       children: [
                         AppLargeText(text: "Trips"),
                         AppText(text: "Mountain", size: 30),
                         SizedBox(height: 20,),
                         Container(
                           width: 250,// to go to the next line. Enfin, limiter sa largeur
                           child: AppText(
                               text: "Mountain hikes gives you an incredible sens of freedom along with endurance test  ",
                               color: AppColors.textColor2,
                               size: 14,

                           ),
                         ),
                         SizedBox(height: 40,),
                         GestureDetector(
                           onTap: (){
                             BlocProvider.of<AppCubits>(context).getData();
                           },
                           child: Container(
                              width: 120,
                               child: Row(

                                 children :[
                                   ResponsiveBotton(width: 120,)
                                 ],
                               )),
                         )
                       ],
                     ),
                     // the neext column for the slider
                     Column(
                       children: List.generate(3, (indexDots) {
                         return Container(
                           margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index== indexDots?25:8,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color:  index== indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                           ),
                         );
                       }),
                     )
                   ],
                 ),

               ),
             );
       }),
    );
  }
}
