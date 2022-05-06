import 'package:flutter/material.dart';
import 'package:moslim/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: getThemeRow('Light', provider.themeMode == ThemeMode.light)),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child:
              getThemeRow('Dark', provider.themeMode == ThemeMode.dark)),
        ],
      ),
    );
  }

  Widget getThemeRow(String text, bool isSelected) {
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
