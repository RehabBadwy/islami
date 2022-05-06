import 'package:flutter/material.dart';
import 'package:moslim/home/suraDetails/sura_details.dart';

class SuraScreen extends StatelessWidget {

  String SuraName;
  int index;
  SuraScreen(this.SuraName,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routName,
          arguments: SuraDetailsArg(SuraName: SuraName, index: index)
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Text(
            SuraName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
