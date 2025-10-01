import 'package:bloc/bloc.dart';




class UserNameCubit extends Cubit <String>{

  UserNameCubit():super('no-username'){
    print('UserNameCubit constructoir called');
  }

  void setUserName (String newUserName){
    emit(newUserName);
  }
}