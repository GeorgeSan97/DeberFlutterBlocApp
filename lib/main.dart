import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() 
{
  serviceLocatorInit(); 
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create:  (context) => getIt<UserNameCubit>() ),
      BlocProvider(create:  (context) => getIt<RoutersimpleCubit>() ),
      BlocProvider(create:  (context) => getIt<CounterCubit>() ),
      BlocProvider(create:  (context) => getIt<ThemeCubit>() ),
    ],
    child: const MyApp());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.watch<RoutersimpleCubit>().state; 
    final theme = context.watch<ThemeCubit>().state; 

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: theme.isDarkmode ).getTheme(),
    );
  }
}
