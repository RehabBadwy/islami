import 'package:flutter/material.dart';
import 'package:moslim/provider/app_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage("en");
                Navigator.pop(context);
              },
              child: getLanguageRow('English', provider.appLanguage == 'en')),
          InkWell(
              onTap: () {
                provider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child: getLanguageRow('العربيه', provider.appLanguage == 'ar'))
        ],
      ),
    );
  }

  Widget getLanguageRow(String text, bool isSelected) {
    if (isSelected) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            Icon(Icons.check, color: Theme.of(context).primaryColor)
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(text, style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      );
    }
  }
}
