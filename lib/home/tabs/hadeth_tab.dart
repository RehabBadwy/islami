import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moslim/home/item_hadeth/item_hadeth.dart';


class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.length==0)
      loadHadethFile();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Expanded(
            child: allHadeth.length ==0
                ? Center(
                child: CircularProgressIndicator()
            )
                : ListView.separated(
              separatorBuilder: (buildContext, index) {
                return Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  color: Theme.of(buildContext).primaryColor,
                );
              },
              itemBuilder: (context, index) {
                return ItemHadeth(allHadeth[index]);
              },
              itemCount: allHadeth.length,
            )),
      ],
    );
  }

  void loadHadethFile() async {
    List<Hadeth> allHadeth = [];
    String fileContent =
    await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> singleHadethList = fileContent.trim().split('#');
    for (int i = 0; i < singleHadethList.length; i++) {
      String hadethContent = singleHadethList[i].trim();
      if (hadethContent.isEmpty) continue;
      List<String> lines = hadethContent.split('\n');
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join();
      allHadeth.add(Hadeth(title, content));
    }
    this.allHadeth = allHadeth;
    setState(() {});
  }
}

class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}