
import 'package:cubit_application/cubit/app_cubit_state.dart';
import 'package:cubit_application/cubit/app_cubits.dart';
import 'package:cubit_application/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogicss extends StatefulWidget {
  const AppCubitLogicss({Key? key}) : super(key: key);

  @override
  _AppCubitLogicssState createState() => _AppCubitLogicssState();
}

class _AppCubitLogicssState extends State<AppCubitLogicss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder <AppCubits, CubitStates>(
        builder : (context, state) {
          if (state is WelcomeState)
            {
              return WelcomePage();
            }
          else
            {
              return Container();
            }

        }

      ),
    );
  }
}
