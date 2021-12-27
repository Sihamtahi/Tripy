
import 'package:cubit_application/pages/navpages/bar_item_page.dart';
import 'package:cubit_application/pages/navpages/home_page.dart';
import 'package:cubit_application/pages/navpages/my_page.dart';
import 'package:cubit_application/pages/navpages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages= [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex =0;
  void onTap(int index){
    setState(() {
      currentIndex =index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // a scaffold because we want to have the body option and it contains the bottom navigation bar


      backgroundColor: Colors.white,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,  // pareil
        unselectedFontSize: 0, // ici pour que la zone en dessous du bottom navigation bar ne soit pas selectable -> pas d'erreur
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex, // the default index
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,




        items: [
          BottomNavigationBarItem(title: Text("Home"),icon: Icon(Icons.apps)),
          BottomNavigationBarItem(title: Text("Bar"),icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(title: Text("Search"),icon: Icon(Icons.search)),
          BottomNavigationBarItem(title: Text("My"),icon: Icon(Icons.person))
        ],

    ),
    );
  }
}
