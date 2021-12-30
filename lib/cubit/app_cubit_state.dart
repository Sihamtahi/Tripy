


import 'package:bloc/bloc.dart';
import 'package:cubit_application/cubit/app_cubits.dart';

class AppCubits extends Cubit<CubitStates>
{
  AppCubits() : super(InitialState())
  {
    emit(WelcomeState());

  } // we will call the initial state


}