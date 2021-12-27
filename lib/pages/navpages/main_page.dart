
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
  @override
  Widget build(BuildContext context) {
    return Scaffold( // a scaffold because we want to have the body option and it contains the bottom navigation bar



      body: pages[0],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,




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
