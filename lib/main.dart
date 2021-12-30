import 'package:cubit_application/cubit/app_cubit_logics.dart';
import 'package:cubit_application/cubit/app_cubit_state.dart';
import 'package:cubit_application/detail_page.dart';
import 'package:cubit_application/pages/navpages/main_page.dart';
import 'package:cubit_application/pages/welcome_page.dart';
import 'package:cubit_application/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context)=>  AppCubits(
          data: DataServices()
        ),
        child: AppCubitLogicss( ),
      )
    );
  }
}
