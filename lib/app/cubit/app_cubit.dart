import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_guys_run/commons/utils/styles.dart';
import 'package:mobile_guys_run/localizations/app_language.dart';
import 'package:mobile_guys_run/repository/authentication_repository.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppStyles styles = DefaultAppStyles();
  AppLanguage language = AppLanguage();
  AppCubit(AppState state, this.authenticationRepository) : super(AppInitial());
  final AuthenticationRepository authenticationRepository;

  void changeStyle(AppStyles styles) {
    this.styles = styles;
    emit(AppChangeStyleSuccess());
  }


  Future<void> fetchLocale() async {
    await language.fetchLocale();
    emit(AppLanguageFetchLocaleCompleted(Locale(language.currentLocale!)));
  }

  Future<void> changeLanguage(String locale) async {
    await language.changeLanguage(locale);
    emit(AppLanguageFetchLocaleCompleted(Locale(locale)));
  }
}
