import 'package:flutter/material.dart';
import 'package:moslim/home/tabs/hadeth_tab.dart';
import 'package:moslim/home/tabs/quran_tab.dart';
import 'package:moslim/home/tabs/radio_tab.dart';
import 'package:moslim/home/tabs/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moslim/home/tabs/settings/setting_screen.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=1;
  var Screen=[
    QuranScreen(),
    SebhaScreen(),
    HadethTab(),
    RadioScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.themeMode==ThemeMode.light ? 'assets/images/default_bg.png' : ''
              'assets/images/dark_bg.png',
        width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                AppLocalizations.of(context)!.islami,
                style:  Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index){
                currentIndex=index;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(icon: ImageIcon(
                  AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran
                ),
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png')),
                label: AppLocalizations.of(context)!.sebha
                ),
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth
                ),
                BottomNavigationBarItem(icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png')),
                label: AppLocalizations.of(context)!.radio
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings
                ),
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
              child: Screen[currentIndex]),
        )
      ],
    );
  }
}
