


import 'package:bloc/bloc.dart';
import 'package:cubit_application/cubit/app_cubits.dart';
import 'package:cubit_application/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>
{
  AppCubits({required this.data}) : super(InitialState())
  {
    emit(WelcomeState());


  }
  final DataServices data;
  late final places;
  void getData() async
  {
    try{
        emit(LoadingState());
        places = await data.getInfo();
        emit(LoadedState(places));
    }
    catch(e)
    {

    }

  }



}