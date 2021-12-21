import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shifftie/DatabaseMethods/local_database.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Screens/welcome.dart';
import 'package:shifftie/Theme/style.dart';
import 'Locale/language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // await LocalDB().init();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Phoenix(
      child: BlocProvider(
    create: (context) => LanguageCubit(),
    child: const Shifftie(),
  )));
}

class Shifftie extends StatelessWidget {
  const Shifftie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) => MaterialApp(
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('id'),
          Locale('fr'),
          Locale('pt'),
          Locale('es'),
          Locale('it'),
          Locale('sw'),
          Locale('tr'),
        ],
        theme: appTheme,
        locale: locale,
        home: const WelcomescreenWidget(),
        routes: PageRoutes().routes(),
      ),
    );
  }
}
