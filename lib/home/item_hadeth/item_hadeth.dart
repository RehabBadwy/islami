import 'package:flutter/material.dart';
import 'package:moslim/home/item_hadeth/hadeth_details.dart';
import 'package:moslim/home/tabs/hadeth_tab.dart';


class ItemHadeth extends StatelessWidget {
  Hadeth hadeth;

  ItemHadeth(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}