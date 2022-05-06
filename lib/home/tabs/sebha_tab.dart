import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class SebhaScreen extends StatefulWidget {

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter=0;

  List<String> allah=[
    'سبحان الله',
    'الحمدلله',
    'الله اكبر'
  ];

  int index=0;
  double angle=0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      width: double.infinity,
       child: Column(
         children: [
          Stack(
           alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.05),
                  child: Image.asset(
                      'assets/images/head_sebha_logo.png'
                  )),
              InkWell(
                onTap: (){
                  onSebha();
                },
                child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.09),
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          provider.themeMode==ThemeMode.light ?
                            'assets/images/body_sebha_logo.png' :
                              'assets/images/body_sebha_dark.png'
                        ))),
              ),
            ],
          ),
           Text(
             'عدد التسبيحات',
             style: Theme.of(context).textTheme.subtitle1,
           ),
           Container(
             margin: EdgeInsets.only(top: 8),
             padding: EdgeInsets.all(18),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Theme.of(context).primaryColor,
             ),
             child: Text(
               '$counter',
             ),
           ),
           Container(
             margin: EdgeInsets.all(12),
             padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(24),
               color: Theme.of(context).primaryColor,
             ),
             child: Text(
                 '${allah[index]}',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 25,
                 fontWeight: FontWeight.bold
               ),
             ),
           ),
      ],
       ),
    );
  }

 void onSebha(){
    counter++;
    if(counter%33==0){
     if(index==allah.length-1){
       index=0;
     }
     index++;
    }
    setState(() {
      angle+=20;
    });
  }
}
