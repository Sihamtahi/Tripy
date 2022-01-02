
import 'package:cubit_application/cubit/app_cubit_state.dart';
import 'package:cubit_application/cubit/app_cubits.dart';
import 'package:cubit_application/misc/colors.dart';
import 'package:cubit_application/widgets/app_large_text.dart';
import 'package:cubit_application/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png" :"Balloning",
    "hiking.png" : "Haking",
    "kayaking.png" : "Kayaking",
    "snorkling.png" : "Snorling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this); // this refers to this context
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if( state is LoadedState)
            {
              var info = state.places;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //menu Text
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.menu, size: 30, color: Colors.black54,),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:  Colors.grey.withOpacity(0.5)
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  // Discover Text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover"),
                  ),
                  SizedBox(height: 20,),
                  // tabbar
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const  EdgeInsets.only(left: 20, right: 20),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                        isScrollable: true,
                        labelColor: Colors.black54,
                        unselectedLabelColor: Colors.grey,

                        controller: _tabController,
                        tabs: [
                          Tab(text: "Places",),
                          Tab(text: "Inspiration",),
                          Tab(text: "Emotions",),
                        ],

                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.maxFinite,
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount : info.length,
                          scrollDirection:  Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://mark.bslmeivu.com/uploads/" +info[index].img
                                    ),
                                    fit: BoxFit.cover
                                ),

                              ),
                            );
                          },

                        ),
                        Text("Hi2"),
                        Text("Hi3"),
                      ],
                    ),
                  ),
                  // Explore more
                  SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Explore more", size: 22,),
                        AppText(text: "See all", color:  AppColors.textColor1,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.maxFinite,
                    height: 120,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount :4,
                        itemBuilder: (_, index) {

                          return Container(
                            margin: const EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Container(
                                  // margin: const EdgeInsets.only(right: 50,),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "img/"+images.keys.elementAt(index)
                                        ),
                                        fit: BoxFit.cover
                                    ),

                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: AppText(text: images.values.elementAt(index), color: AppColors.textColor2,),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
          else
            {
              return Container();
            }

        },

      )
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius );
  }

}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height -radius);
    canvas.drawCircle(offset+circleOffset , radius, _paint);
  }

}