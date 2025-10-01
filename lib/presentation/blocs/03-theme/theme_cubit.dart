import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {

  ThemeCubit({
      bool darkmode = false,
    }) : super(ThemeState( isDarkmode: darkmode ));

  void toogleTheme() {
    emit( ThemeState( isDarkmode: !state.isDarkmode ) );
  }

  void setDarkmode() {
    emit( const ThemeState( isDarkmode: true ) );
  }

  void setLightmode() {
    emit( const ThemeState( isDarkmode: false ) );
  }

}
