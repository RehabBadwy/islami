import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:moslim/model/Radios.dart';
import 'package:moslim/my_theme.dart';

class RadioItem extends StatefulWidget {
  Radios item;
  Function play;
  Function pause;
  RadioItem(this.item,this.play,this.pause);

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text('${widget.item.name}',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){
               widget.play(widget.item.radioUrl);
              }, icon: Icon(Icons.play_arrow),
              color: MyThemeData.colorGold,
                iconSize: 45,
              ),
              IconButton(onPressed: (){
                widget.pause();
              }, icon: Icon(Icons.pause),
                color: MyThemeData.colorGold,
                iconSize: 45,
              ),
            ],
          )
        ],
      ),
    );
  }


}
