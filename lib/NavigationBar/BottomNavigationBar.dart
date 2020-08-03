import 'dart:io';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../AppLocalizations.dart';

List<TabItem> getItem() {
  List<TabItem> lst = List<TabItem>();
  lst.add(TabItem(icon: Icons.home, title: "ראשי"));
  lst.add(TabItem(icon: Icons.search, title: "חיפוש"));
  lst.add(TabItem(icon: Icons.update, title: "הסטוריה"));
  lst.add(TabItem(icon: Icons.favorite, title: "מועדפים"));
  lst.add(TabItem(icon: Icons.person_pin, title: "אזור אישי"));
  return lst;
}

class Builder extends DelegateBuilder {
  final List<Widget> lstWidget;

  Builder(this.lstWidget);

  @override
  Widget build(BuildContext context, int index, bool active) {
    // TODO: implement build
    return lstWidget[index];
  }
}

Widget getBottomNavigationBar(
    BuildContext context, Color themeColor, int selected, Function function,
    {bool isEnglish = false}) {
  List<Widget> lstIcon = List<Widget>();
  List<Widget> lstTitle = List<Widget>();

  // ADD ICON
  lstIcon.add(Icon(
    Icons.home,
    color: selected == 0 ? themeColor : Colors.black,
  ));
  lstIcon.add(Icon(
    Icons.search,
    color: selected == 1 ? themeColor : Colors.black,
  ));
  lstIcon.add(Icon(
    Icons.update,
    color: selected == 2 ? themeColor : Colors.black,
  ));
  lstIcon.add(Icon(
    Icons.favorite,
    color: selected == 3 ? themeColor : Colors.black,
  ));
  lstIcon.add(Icon(
    Icons.person_pin,
    color: selected == 4 ? themeColor : Colors.black,
  ));

  lstTitle.add(Text(
    isEnglish ? "Home" : "ראשי",
    style: TextStyle(
      color: selected == 0 ? themeColor : Colors.black,
    ),
  ));
  lstTitle.add(Text(
    isEnglish ? "Search" : "חיפוש",
    style: TextStyle(
      color: selected == 1 ? themeColor : Colors.black,
    ),
  ));
  lstTitle.add(Text(
    isEnglish ? "Update" : "הסטוריה",
    style: TextStyle(
      color: selected == 2 ? themeColor : Colors.black,
    ),
  ));
  lstTitle.add(Text(
    isEnglish ? "Favorite" : "מועדפים",
    style: TextStyle(
      color: selected == 3 ? themeColor : Colors.black,
    ),
  ));
  lstTitle.add(Text(
    isEnglish ? "Profile" : "אזור אישי",
    style: TextStyle(
      color: selected == 4 ? themeColor : Colors.black,
    ),
  ));

  List<Widget> lstWidget = List<Widget>();

  for (int i = 0; i < lstTitle.length; i++) {
    /*if(i==selected)
        {
          lstWidget.add(CircleAvatar(
            backgroundColor: Colors.white,
            child: Column(
              children: <Widget>[
                lstIcon[i],
                lstTitle[i],
              ],
            ),
          ));
        }
      else
        {
          lstWidget.add(Column(
            children: <Widget>[
              lstIcon[i],
              lstTitle[i],
            ],
          ));
        }*/

    lstWidget.add(Column(
      children: <Widget>[
        lstIcon[i],
        lstTitle[i],
      ],
    ));
  }

  return ConvexAppBar.builder(
      backgroundColor: Colors.white,
      initialActiveIndex: selected,
      onTap: function,
      curve: Curves.easeOutCubic,
      itemBuilder: Builder(lstWidget),
      count: lstWidget.length);
}

Widget getOriginalBottomNavigationBar(BuildContext context, Color themeColor) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    //items: _getBottomNavigationBarList(context, themeColor),
    items: Platform.localeName.startsWith("en")?_getBottomNavigationBarList(context, themeColor):_getBottomNavigationBarList(context, themeColor).reversed.toList(),
  );
}

List<BottomNavigationBarItem> _getBottomNavigationBarList(
    BuildContext context, Color themeColor) {
  List<BottomNavigationBarItem> lst=List<BottomNavigationBarItem>();
  lst.add(BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: themeColor,
    ),
    title: Text(
      AppLocalizations.of(context).translate("main"),
      style: TextStyle(
        color: themeColor,
      ),
    ),
  ));
  lst.add(BottomNavigationBarItem(
    icon: Icon(
      Icons.search,
      color: Colors.black,
    ),
    title: Text(
      AppLocalizations.of(context).translate("search"),
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ));
  lst.add(BottomNavigationBarItem(
    icon: Icon(
      Icons.update,
      color: Colors.black,
    ),
    title: Text(
      AppLocalizations.of(context).translate("update"),
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ));
  lst.add(BottomNavigationBarItem(
    icon: Icon(
      Icons.favorite,
      color: Colors.black,
    ),
    title: Text(
      AppLocalizations.of(context).translate("favorite"),
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ));
  lst.add(BottomNavigationBarItem(
    icon: Icon(
      Icons.person_pin,
      color: Colors.black,
    ),
    title: Text(
      AppLocalizations.of(context).translate("profile"),
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ));
  return lst;
}
