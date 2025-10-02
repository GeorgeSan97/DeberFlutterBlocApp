import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

import '../../config/router/app_router.dart';

GetIt getIt = GetIt.instance;


void serviceLocatorInit() {

  getIt.registerSingleton(UserNameCubit());
  getIt.registerSingleton(RoutersimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(GuestsBloc());
  
}


