import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../AppLocalizations.dart';

Widget getAppBar(BuildContext context, String title, {String from = "Home"}) {
  Widget actionSOS = GestureDetector(
    onTap: () {
      Fluttertoast.showToast(
          msg: "You tap on SOS",
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          backgroundColor: Colors.black,
          fontSize: 16.0);
    },
    child: Image.asset(
      "assets/images/sos_icon.png",
      width: 50,
      height: 50,
    ),
  );

  Widget actionBack = IconButton(
      icon: Icon(Platform.localeName.startsWith("he")? Icons.arrow_back_ios : Icons.arrow_forward_ios, color: Colors.white),
      onPressed: () {
        Navigator.pop(context);
      });

  Widget actionLocation = GestureDetector(
    onTap: () {
      Fluttertoast.showToast(
          msg: "You tap on Location",
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          backgroundColor: Colors.black,
          fontSize: 16.0);
    },
    child: Image.asset(
      "assets/images/location_icon.png",
      width: 30,
      height: 30,
    ),
  );

  Widget appTitle;


  if(Platform.localeName.startsWith("he"))
    {
      appTitle = Row(
        children: <Widget>[
        from=="Home"?actionSOS:actionBack,
        Expanded(
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actionLocation,
        ],
      );


    }
  else
    {
      appTitle = Row(
        children: <Widget>[
          actionLocation,
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          from=="Home"?actionSOS:actionBack,
        ],
      );
    }

  return Stack(
    children: <Widget>[
      Image.asset(
        "assets/images/appbar_background.png",
        fit: BoxFit.fill,
        height: 160,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 12, right: 12, bottom: 7),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2.0,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top + 20,
            ),
            appTitle,
            SizedBox(
              height: 10,
            ),
            Container(
              height: 42,
              padding: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Platform.localeName.startsWith("he")?
              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    prefixIcon:
                    Icon(Icons.search, color: Colors.grey, size: 20),
                    border: InputBorder.none,
                    hintText:
                    AppLocalizations.of(context).translate("find_heading")),
              ):
              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    suffixIcon:
                        Icon(Icons.search, color: Colors.grey, size: 20),
                    border: InputBorder.none,
                    hintText:
                        AppLocalizations.of(context).translate("find_heading")),
              ),
            )
          ],
        ),
      ),
    ],
  );
}


