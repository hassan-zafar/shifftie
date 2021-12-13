import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  void selectEngLanguage() {
    emit(const Locale('en'));
  }

  void selectArabicLanguage() {
    emit(const Locale('ar'));
  }

  void selectPortugueseLanguage() {
    emit(const Locale('pt'));
  }

  void selectFrenchLanguage() {
    emit(const Locale('fr'));
  }

  void selectIndonesianLanguage() {
    emit(const Locale('id'));
  }

  void selectSpanishLanguage() {
    emit(const Locale('es'));
  }

  void selectItalianLanguage() {
    emit(const Locale('it'));
  }

  void selectTurkishLanguage() {
    emit(const Locale('tr'));
  }

  void selectSwahiliLanguage() {
    emit(const Locale('sw'));
  }
}
