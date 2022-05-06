import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moslim/home/tabs/radio_item.dart';
import 'package:moslim/model/RadioRespoces.dart';
import 'package:http/http.dart' as http;

class RadioScreen extends StatefulWidget {
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late Future<RadioRespoces> radioResponces;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radioResponces = fetchRadio();
    audioPlayer = AudioPlayer();
  }
  play(String url) async {
    int result = await audioPlayer.play(url);
  }

  pause() async{
    await audioPlayer.pause();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioRespoces>(
      future: radioResponces,
        builder: (_,snapshot){
          if(snapshot.hasData){
            print(snapshot.data!.radios![0].name);
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/images/radio_image.png',
                  width: MediaQuery.of(context).size.width *.9,
                    height: MediaQuery.of(context).size.height *.3,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.radios!.length,
                    itemBuilder: (_,index){
                      return RadioItem(snapshot.data!.radios![index],play,pause);
                    }),
                )
              ],
            );
          }else if(snapshot.hasError){
            return Center(
              child: IconButton(
               onPressed: (){
                 radioResponces = fetchRadio();
               },
               icon: Icon(Icons.refresh),
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<RadioRespoces> fetchRadio() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RadioRespoces.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
