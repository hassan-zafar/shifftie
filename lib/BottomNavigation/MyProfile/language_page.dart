import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifftie/Locale/language_cubit.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  late LanguageCubit _languageCubit;
  int? _selectedLanguage = -1;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _languages = [
      'English',
      'عربى',
      'français',
      'bahasa Indonesia',
      'português',
      'Español',
      'italiano',
      'Türk',
      'Kiswahili'
    ];
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        _selectedLanguage = getCurrentLanguage(locale);
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.changeLanguage!),
          ),
          body: FadedSlideAnimation(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (context, index) => RadioListTile(
                onChanged: (dynamic value) async {
                  setState(() {
                    _selectedLanguage = value;
                    Navigator.pushNamed(context, PageRoutes.bottomNavigation);
                  });
                  if (_selectedLanguage == 0) {
                    _languageCubit.selectEngLanguage();
                  } else if (_selectedLanguage == 1) {
                    _languageCubit.selectArabicLanguage();
                  } else if (_selectedLanguage == 2) {
                    _languageCubit.selectFrenchLanguage();
                  } else if (_selectedLanguage == 3) {
                    _languageCubit.selectIndonesianLanguage();
                  } else if (_selectedLanguage == 4) {
                    _languageCubit.selectPortugueseLanguage();
                  } else if (_selectedLanguage == 5) {
                    _languageCubit.selectSpanishLanguage();
                  } else if (_selectedLanguage == 6) {
                    _languageCubit.selectItalianLanguage();
                  } else if (_selectedLanguage == 7) {
                    _languageCubit.selectTurkishLanguage();
                  } else if (_selectedLanguage == 8) {
                    _languageCubit.selectSwahiliLanguage();
                  }
                },
                groupValue: _selectedLanguage,
                value: index,
                title: Text(_languages[index]),
              ),
            ),
            beginOffset: const Offset(0, 0.3),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        );
      },
    );
  }

  int getCurrentLanguage(Locale locale) {
    if (locale == const Locale('en')) {
      return 0;
    } else if (locale == const Locale('ar')) {
      return 1;
    } else if (locale == const Locale('fr')) {
      return 2;
    } else if (locale == const Locale('id')) {
      return 3;
    } else if (locale == const Locale('pt')) {
      return 4;
    } else if (locale == const Locale('es')) {
      return 5;
    } else if (locale == const Locale('it')) {
      return 6;
    } else if (locale == const Locale('tr')) {
      return 7;
    } else if (locale == const Locale('sw')) {
      return 8;
    } else {
      return -1;
    }
  }
}
