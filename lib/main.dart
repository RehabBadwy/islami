import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moslim/home/home_screen.dart';
import 'package:moslim/home/item_hadeth/hadeth_details.dart';
import 'package:moslim/home/suraDetails/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moslim/provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (buildContext){
          return AppProvider();
        },
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Arabic, no country code
      ],
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetails.routName:(context)=>SuraDetails(),
        HadethDetailsScreen.routeName:(context) =>HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
    );
  }
}