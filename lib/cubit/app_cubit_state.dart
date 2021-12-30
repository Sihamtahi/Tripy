


import 'package:bloc/bloc.dart';
import 'package:cubit_application/cubit/app_cubits.dart';

class Appcubit extends Cubit<CubitStates>
{
  Appcubit() : super(InitialState())
  {
    emit(WelcomeState());

  } // we will call the initial state


}