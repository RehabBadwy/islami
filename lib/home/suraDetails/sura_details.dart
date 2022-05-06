import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:moslim/home/suraDetails/verses_item.dart';

class SuraDetails extends StatefulWidget {

  static const String routName= 'sura';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArg;
    if(verses.length==0)
    loadFile('${args.index+1}');
    return Stack(
      children: [
        Image.asset('assets/images/default_bg.png',
        width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(args.SuraName,
            style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: verses.length==0 ?
          Center(
              child: CircularProgressIndicator()):
          ListView.builder(
              itemBuilder: (context,index){
                return  VersesScreen(verses[index],index+1);
              },
            itemCount: verses.length,
          ),
        )
      ],
    );
  }

 void loadFile(String fileName)async{
  String fileContent = await rootBundle.loadString('assets/file/$fileName.txt');
  List<String> verses =fileContent.split('\n');
  this.verses=verses;
  setState(() {

  });
  }
}

class SuraDetailsArg{
  String SuraName;
  int index;
  SuraDetailsArg({required this.SuraName,required this.index});
}
